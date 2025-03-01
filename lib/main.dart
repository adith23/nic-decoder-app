import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/screens/input_screen.dart';

/// The main entry point of the application.
///
/// It initializes the Flutter app and sets [InputScreen] as the home screen.
void main() {
  runApp(const MyApp());
}

/// The root widget of the NIC Decoder application.
///
/// Uses [GetMaterialApp] for navigation and state management.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}
