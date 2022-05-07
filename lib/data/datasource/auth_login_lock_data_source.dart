import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLoginLockDataSource {
  Future<void> onLoginFailed();

  Future<void> onLoginSuccess();

  Future<int> getAttemptCount();

  Future<int> getRemainingLockTime();

  Future<void> deleteAll();
}

const String keyAttemptCount = 'loginAttemptCount';
const String keyLockTime = 'loginLockTime';
const String keyLastLoginTime = 'lastLoginTime';

const int maxLockTime = 24 * 60 * 60 * 1000;

@Injectable(as: AuthLoginLockDataSource)
class AuthLoginLockDataSourceImpl extends AuthLoginLockDataSource {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  static Map<int, int> lockTimeByAttemptCount = {
    1: 0,
    2: 0,
    3: 5 * 1000, // 5 seconds
    4: 60 * 1000, // 1 minutes
    5: 15 * 60 * 1000, // 15 minutes
    6: 60 * 60 * 1000, // 1 hour
    7: 6 * 60 * 60 * 1000, // 6 hour
    8: maxLockTime, // 24 hour
  };

  @override
  Future<int> getRemainingLockTime() async {
    final sharedPrefs = await _prefs;
    final lockDuration = sharedPrefs.getInt(keyLockTime) ?? 0;

    final lastLoginAttemptTime = sharedPrefs.getInt(keyLastLoginTime) ?? 0;
    final currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

    final millisElapsed = currentTimeMillis - lastLoginAttemptTime;
    return millisElapsed < lockDuration ? lockDuration - millisElapsed : 0;
  }

  @override
  Future<int> getAttemptCount() async {
    final sharedPrefs = await _prefs;
    return sharedPrefs.getInt(keyAttemptCount) ?? 0;
  }

  @override
  Future<void> onLoginFailed() async {
    final sharedPrefs = await _prefs;
    final count = sharedPrefs.getInt(keyAttemptCount);
    final newCount = (count ?? 0) + 1;
    await sharedPrefs.setInt(keyAttemptCount, newCount);

    // set lock time
    final lockValue = lockTimeByAttemptCount[newCount] ?? maxLockTime;
    await sharedPrefs.setInt(keyLockTime, lockValue);

    // set last login attempt time
    final lastLoginTime = DateTime.now().millisecondsSinceEpoch;
    await sharedPrefs.setInt(
      keyLastLoginTime,
      lastLoginTime,
    );

    return;
  }

  @override
  Future<void> onLoginSuccess() async {
    final sharedPrefs = await _prefs;
    await sharedPrefs.setInt(keyAttemptCount, 0);
    await sharedPrefs.setInt(keyLockTime, 0);
    return;
  }

  @override
  Future<void> deleteAll() async {
    final sharedPrefs = await _prefs;
    await sharedPrefs.clear();
    return;
  }
}
