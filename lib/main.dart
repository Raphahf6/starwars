import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars',
      theme: ThemeData(
          scaffoldBackgroundColor: kbackgroundColor,
          primaryColor: kbackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: ktextColor)),
      home: const HomeScreen(),
    );
  }
}
