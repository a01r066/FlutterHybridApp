import 'package:flutter/material.dart';
import 'package:viez_module/config/service_locator.dart';
import 'package:viez_module/pages/home_controller/home_controller_page.dart';
import 'config/app_ config.dart';

// void main() async {
//   AppConfig devAppConfig = const AppConfig(appName: 'CounterApp Dev', flavor: 'dev');
//   Widget app = await initializeApp(devAppConfig);
//   runApp(app);
// }

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  return MyApp(appConfig: appConfig);
}

class MyApp extends StatefulWidget {
  final AppConfig appConfig;

  const MyApp({super.key, required this.appConfig});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  Widget _flavorBanner(Widget child) {
    return Banner(
      location: BannerLocation.topEnd,
      message: widget.appConfig.flavor,
      color: widget.appConfig.flavor == 'dev'
          ? Colors.red.withOpacity(0.6)
          : Colors.green.withOpacity(0.6),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14.0, letterSpacing: 1.0),
      textDirection: TextDirection.ltr,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.appConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _flavorBanner(
          const HomeControllerPage(title: "Flutter Demo Home Page")),
    );
  }
}
