import 'package:flutter/material.dart';
import 'package:pinterest_layout/src/models/layout_model.dart';
import 'package:pinterest_layout/src/page/launcher_tablet_page.dart';
import 'package:provider/provider.dart';


import 'package:pinterest_layout/src/themes/theme_changer.dart';
import 'package:pinterest_layout/src/page/launcher_page.dart';


void main() => runApp(

  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
    ],
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
      theme: appTheme.currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }

}