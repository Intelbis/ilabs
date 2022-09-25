import 'package:flutter/material.dart';
import 'widgets/DataTableMySqlTest/DataTableDemo.dart';


void main (){

  runApp(
    new HomeApp(),
  );
}


class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: new DataTableDemo(),
    );
  }
}