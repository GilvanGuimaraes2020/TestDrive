import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/templates/homepage.dart';

void main() {
  runApp( ChangeNotifierProvider(
      
      
      create: (context)=> Filtro(),
      
     
        child: const MyApp()
        ) ,
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Dryve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

