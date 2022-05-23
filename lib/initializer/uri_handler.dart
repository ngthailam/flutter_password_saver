import 'package:flutter/services.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/is_need_log_in_use_case.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:injectable/injectable.dart';
import 'package:uni_links/uni_links.dart';

abstract class UriHandler {
  Future<void> initialize();

  Future<Uri?> getInitUri();

  Future<void> handleUri(Uri? uri);

  Uri? getPendingUri();

  void markPendingUriResolved();
}

@Singleton(as: UriHandler)
class UriHandlerImpl implements UriHandler {
  // ignore: unused_field
  Stream<Uri?>? _uniLinkStream;

  Uri? _pendingUri;

  @override
  Future<void> handleUri(Uri? uri) async {
    if (uri == null) return;
    try {
      final routeName = uri.getCleanRouteName();
      final needLogin = await getIt<IsNeedLogInUseCase>().execute(null);
      final finalRoute = needLogin ? AppRouter.login : routeName;
      if (needLogin) {
        // If user needs to login, then navigate to login screen,
        // so any uri here is not immediately handled -> move to _pendingUri
        _pendingUri = uri;
      }
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        finalRoute,
        (route) => route.settings.name != finalRoute,
      );
    } on Exception {
      // Do nothing
    }
  }

  @override
  Future<void> initialize() async {
    try {
      final uri = await getInitialUri();
      _pendingUri = uri;

      _uniLinkStream = uriLinkStream
        ..listen((Uri? uri) {
          handleUri(uri);
        });
    } on PlatformException {
      // do nothing in this case
    }
  }

  @override
  Future<Uri?> getInitUri() async {
    try {
      return getInitialUri();
    } on Exception {
      return null;
    }
  }

  @override
  Uri? getPendingUri() {
    return _pendingUri;
  }

  @override
  void markPendingUriResolved() {
    _pendingUri = null;
  }
}

extension UriExt on Uri {
  String getCleanRouteName() {
    final routeName = path.replaceAll('passsaver://android/', '');
    return routeName.substring(1, routeName.length);
  }
}
