import 'package:flutter/material.dart';
import 'package:pinterest_layout/src/models/layout_model.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:pinterest_layout/src/page/pinterest_page.dart';
import 'package:pinterest_layout/src/routes/route.dart';
import 'package:pinterest_layout/src/themes/theme_changer.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text('Diseños en Flutter - Tableta'),
      ),

      drawer: _MenuPrincipal(),

      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones()
          ),
          Container(
            width: 1.0,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey : appTheme.currentTheme.accentColor
          ),
          Expanded(
            child: layoutModel.currentPage
          )
        ],
      )
   );
  }
}

class _ListaOpciones extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutModel>(context, listen: false);


    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(

        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () => layoutModel.currentPage = pageRoutes[i].page,

      ),  
    );
  }
}

class _MenuPrincipal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[

            SafeArea(
              child: Container(
                padding: EdgeInsets.only( top: 10),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text("EL", style: TextStyle( fontSize: 50 ))
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),

            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme, 
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) => appTheme.customTheme = value
              ),
            )
          ],
        ),  
      ),
    );
  }
  
}