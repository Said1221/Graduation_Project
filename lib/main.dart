
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/Homepage.dart';
import 'package:qrcode/LoginScreen.dart';
import 'package:qrcode/Map.dart';
import 'package:qrcode/User.dart';




void main()
async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}