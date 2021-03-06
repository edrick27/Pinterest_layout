import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_layout/Widgets/menu.dart';
import 'package:pinterest_layout/src/themes/theme_changer.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onpress: (){ print('tap pie_chart'); }),
    PinterestButton(icon: Icons.search, onpress: (){ print('tap search'); }),
    PinterestButton(icon: Icons.notifications, onpress: (){ print('tap notifications'); }),
    PinterestButton(icon: Icons.supervised_user_circle, onpress: (){ print('tap supervised_user_circle'); }),
  ];


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _menuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _CreateGrid(),
            _PrinterestMenuLocation()
          ],
        ),

        // body: createGrid(),
        // bottomNavigationBar: PinterestMenu()
      ),
    );

  }
}


class _CreateGrid extends StatefulWidget {

  _CreateGrid();

  @override
  __CreateGridState createState() => __CreateGridState();
}

class __CreateGridState extends State<_CreateGrid> {

  final List items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0 ;


  @override
  void initState() {

    controller.addListener(() {

      print("scroll listener ${ controller.offset }");

      Provider.of<_menuModel>(context, listen: false).mostrar = ! ( controller.offset > scrollAnterior && controller.offset > 100);

      scrollAnterior = controller.offset;

    });

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    int count;

    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    
    return Container(
      child: StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: count,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all( Radius.circular(30) ),
              color: Colors.blue,
            ),
            child: new Center(
              // child: new CircleAvatar(
              //   backgroundColor: Colors.white,
              //   child: new Text('$index')
              // )
            )
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 1 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }
}

class _PrinterestMenuLocation extends StatelessWidget {

  const _PrinterestMenuLocation();
  

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    double width = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_menuModel>(context).mostrar;

    if( width > 500) {

      width = width - 300;

    }

    return Positioned(
      bottom: 25,
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
              items: [
                PinterestButton(icon: Icons.pie_chart, onpress: (){ print('tap pie_chart'); }),
                PinterestButton(icon: Icons.search, onpress: (){ print('tap search'); }),
                PinterestButton(icon: Icons.notifications, onpress: (){ print('tap notifications'); }),
                PinterestButton(icon: Icons.supervised_user_circle, onpress: (){ print('tap supervised_user_circle'); }),
              ],
              mostrar: mostrar,
              backGroundColor: appTheme.scaffoldBackgroundColor,
            ),
            Spacer()
          ],
        )
      )
    );
  }
}

class _menuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool value){
    _mostrar = value;
    notifyListeners();
  }
  
}