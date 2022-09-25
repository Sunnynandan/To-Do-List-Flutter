import 'package:flutter/material.dart';
import 'package:flutter_application_1/CRUD.dart';
// ignore: unused_import
import 'package:flutter_application_1/List_data.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Crud(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.blue[50]),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 5,
                fixedSize: const Size(150, 50),
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue[50]),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, elevation: 6),
        backgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
