import 'package:flutter/material.dart';
import './screens/homepage/homepage.dart';
import 'screens/showall/showalldetails.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        ShowAllDeatils.routeName : (context)=>ShowAllDeatils()
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


