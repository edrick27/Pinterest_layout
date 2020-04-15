import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest_layout/src/routes/route.dart';
import 'package:pinterest_layout/src/themes/theme_changer.dart';
import 'package:provider/provider.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),

      drawer: _MenuPrincipal(),

      body: _ListaOpciones()
   );
  }
}

class _ListaOpciones extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

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
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => pageRoutes[i].page )),

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