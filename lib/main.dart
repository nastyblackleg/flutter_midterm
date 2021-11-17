import 'package:flutter/material.dart';
import 'package:midterm_app/screens/add_car.dart';
import 'package:midterm_app/screens/edit_car.dart';
import 'package:midterm_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddCar(),
        '/edit': (context) => const EditCar()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
