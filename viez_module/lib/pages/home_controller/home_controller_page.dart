import 'package:flutter/material.dart';

class HomeControllerPage extends StatefulWidget {
  const HomeControllerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeControllerPage> createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(widget.title),
    ));
  }
}
