import 'package:flutter/material.dart';
import 'config/app_ config.dart';
import 'main.dart';

void main() async {
  AppConfig devAppConfig = const AppConfig(appName: 'CounterApp Dev', flavor: 'dev');
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}