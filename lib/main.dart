import 'package:provider/provider.dart';
import './screens/registration_screen.dart';
import './models/registration_model.dart';
import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      RegistarationProvider(model: RegistrationModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFcb4352),
      ),
      home: const RegistrationWidget(),
    );
  }
}
