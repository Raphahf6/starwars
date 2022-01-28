import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/body.dart';
import 'package:starwars_app/screens/webview/webview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Body(),
    );
  }
}
