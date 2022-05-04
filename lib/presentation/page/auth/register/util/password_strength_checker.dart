class PasswordStrengthChecker {
  // 0: Nothing
  // 1: Weak
  // 2: Medium
  // 3: Strong
  // 4: Excellent
  static int check(String password) {
    print('ZZLL Checking...');
    int strengthIndex = 0;

    if (password.isEmpty) return strengthIndex;

    if (password.contains(RegExp(r'[a-z]'))) {
      print('ZZLL true 1');
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[A-Z]'))) {
      print('ZZLL true 2');
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[0-9]'))) {
      print('ZZLL true 3');
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[\-_!?@]'))) {
      print('ZZLL true 4');
      strengthIndex++;
    }

    return strengthIndex;
  }
}
