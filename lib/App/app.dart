import 'package:flutter/material.dart';
import 'package:myapp/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter learn",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomeView(),
    );
  }
}
