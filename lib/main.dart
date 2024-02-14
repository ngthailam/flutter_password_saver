import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/initializer/hive_initializer.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/hot_restart_widget.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/initializer/language_util.dart';
import 'package:flutter_password_saver/util/multi_value_listener_builder.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';
import 'package:flutter_password_saver/initializer/uri_handler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'main.config.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// This is our global ServiceLocator
final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await initHive();
  await initPreferences();
  await initUniLink();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

Future<void> initUniLink() async {
  await getIt<UriHandler>().initialize();
}

Future<void> initPreferences() async {
  final prefUseCase = getIt<AccountPreferenceUseCase>();
  final isDarkModeEnabled = await prefUseCase.getIsDarkModeEnabled();
  final language = await prefUseCase.getLanguageCode();
  if (isDarkMode() != isDarkModeEnabled) {
    changeThemeMode();
  }
  if (language != MyApp.languageCodeNotifier.value) {
    setLanguage(language);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
      AccountPreference.enableDarkModeDefault
          ? ThemeMode.dark
          : ThemeMode.light);

  static final ValueNotifier<String> languageCodeNotifier =
      ValueNotifier(AccountPreference.languageCodeDefault);

  static void resetDefaultTheme() {
    themeNotifier.value = AccountPreference.enableDarkModeDefault
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void resetDefaultLanguage() {
    languageCodeNotifier.value = AccountPreference.languageCodeDefault;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precachePicture(
      SvgPicture.asset('assets/svg/login.svg').pictureProvider,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HotRestart(
      child: MultiValueListenableBuilder(
        valueListenables: [
          MyApp.themeNotifier,
          MyApp.languageCodeNotifier,
        ],
        builder: (ctx, values, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('vi', 'VN'),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Password Saver',
            navigatorObservers: [routeObserver],
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: values[0],
            locale: Locale(values[1]),
            onGenerateRoute: (RouteSettings settings) =>
                AppRouter.generateRoute(settings),
            initialRoute: AppRouter.gateway,
          );
        },
      ),
    );
  }
}

class AppTheme {
  static ThemeData light = ThemeData(
    primaryColor: AppColors.blue500,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white500,
    brightness: Brightness.light,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? AppColors.blue500
            : AppColors.ink300;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? AppColors.white400
            : AppColors.ink100;
      }),
      trackOutlineColor: MaterialStateProperty.all(
        AppColors.white200,
      ),
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? AppColors.blue400
            : AppColors.ink300;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? AppColors.white400
            : AppColors.white100;
      }),
      trackOutlineColor: MaterialStateProperty.all(
        AppColors.white200,
      ),
    ),
  );
}
