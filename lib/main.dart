import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';


import 'global_varaible.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            primary: Color.fromRGBO(254, 206, 1, 1),
            seedColor: Color.fromRGBO(254, 206, 1, 1)),
           appBarTheme: AppBarTheme(
             titleTextStyle: TextStyle(
               fontSize: 20,
               color: Colors.black,
             )
           ),
           textTheme: TextTheme(
             titleMedium: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),
             bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
             ),
            titleLarge: TextStyle(
               fontWeight: FontWeight.bold,
             fontSize: 35
           ),
           ),
        useMaterial3: true
      ),

      debugShowCheckedModeBanner: false,
       home: HomePage()

    );
  }
}


