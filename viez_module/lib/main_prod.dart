import 'package:flutter/material.dart';
import 'config/app_ config.dart';
import 'main.dart';

void main() async {
  AppConfig devAppConfig = const AppConfig(appName: 'CounterApp Prod', flavor: 'prod');
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}