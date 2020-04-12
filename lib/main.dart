import 'package:flutter/material.dart';
import 'package:pinterest_layout/src/page/sliver_page.dart';
 

// import 'package:pinterest_layout/src/page/emergancy_page.dart';
// import 'package:pinterest_layout/src/page/pinterest_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SliverPage()
    );
  }
}