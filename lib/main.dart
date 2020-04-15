import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:pinterest_layout/src/themes/theme_changer.dart';
import 'package:pinterest_layout/src/page/launcher_page.dart';


void main() => runApp(

  ChangeNotifierProvider(
    create: (_) => new ThemeChanger(2),
    child: MyApp()
  )

);
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
      theme: appTheme.currentTheme
    );
  }

}