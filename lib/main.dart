

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/maps/geolocation.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseApp.allApps();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Geolocation(),
    );
  }
}

