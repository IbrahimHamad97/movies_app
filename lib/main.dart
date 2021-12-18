import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/loading.dart';

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
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
