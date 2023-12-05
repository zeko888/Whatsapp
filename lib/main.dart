import 'package:flutter/material.dart';
import 'package:whatsapp/pages/home_screen.dart';
 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:WhatsAppClone(), // Use HomeScreen instead of WhatsAppClone
    );
  }
}
