import 'package:flutter/material.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  initDatabase();

  runApp(const MyApp());
}

void initDatabase() {
  Hive
    ..initFlutter()
    ..registerAdapter(PasswordEntityAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouter.generateRoute(settings),
      initialRoute: AppRouter.home,
    );
  }
}
