import 'package:flutter_app_shortcut/flutter_app_shortcut.dart';
import 'package:flutter_app_shortcut/short_cut_arg.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:injectable/injectable.dart';

abstract class AppShortcutManager {
  void pushCreatePassShortcut();

  void removeAll();
}

@Injectable(as: AppShortcutManager)
class AppShortcutManagerImpl implements AppShortcutManager {
  @override
  void pushCreatePassShortcut() {
    final shortcuts = ShortcutArg(
      id: 'id_create_pass',
      title: 'Save new password',
      iconResourceName: 'ic_add',
      androidArg: AndroidArg(
        uri: 'passsaver://android/${AppRouter.savePassword}',
      ),
    );
    FlutterAppShortcut().push(shortcuts);
  }

  @override
  void removeAll() {
    FlutterAppShortcut().removeAll();
  }
}
