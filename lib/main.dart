import 'package:flutter/material.dart';
import 'package:flutter_password_saver/initializer/hive_initializer.dart';
import 'package:flutter_password_saver/presentation/page/gateway/gateway_page.dart';
import 'package:flutter_password_saver/presentation/widget/hot_restart_widget.dart';
import 'package:flutter_password_saver/util/app_router.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Title of Application',
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (RouteSettings settings) =>
            AppRouter.generateRoute(settings),
        initialRoute: getInitialRoute(),
        home: const GatewayPage(),
      ),
    );
  }

  String getInitialRoute() {
    return AppRouter.gateway;
  }
}
