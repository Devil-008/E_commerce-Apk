import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute : 'login',
      //  routes: {
      //   'login': (context) =>  const Login(),
      //   'register': (context) =>  const Register(),
      // },
      title: "Project1",
      color: Colors.amber,
      home: const HomePage(),
     
    );
  }
}
