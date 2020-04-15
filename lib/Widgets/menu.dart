import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton {

  final Function onpress;
  final IconData icon;

  PinterestButton({
    @required this.onpress,
    @required this.icon
  });
  
}

class PinterestMenu extends StatelessWidget {

  bool mostrar;
  final List<PinterestButton> items;
  Color backGroundColor;

  PinterestMenu({
    @required this.items,
    this.mostrar,
    this.backGroundColor,
  });

  
  
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _menuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: mostrar ? 1 : 0,
        child: _PinterestMenuBackground(
          backGroundColor: backGroundColor,
          child: _MenuItems( menuItems: items )
        )
      )
    );
  
  }

}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;
  final Color backGroundColor;

  _PinterestMenuBackground({
    @required this.child,
    @required this.backGroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius:  BorderRadius.all( Radius.circular(100) ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3, 5),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

   final List<PinterestButton> menuItems;

   _MenuItems({
     this.menuItems
   });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(menuItems.length, (i) => _MenuButton(i, this.menuItems[i]))
    );
  
  }

}

class  _MenuButton extends StatelessWidget {

  int index;
  PinterestButton button;

  _MenuButton(this.index, this.button);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_menuModel>(context).indexSelecionado;
    
    return GestureDetector(
      onTap: (){
        Provider.of<_menuModel>(context, listen: false).indexSelecionado = this.index;
        button.onpress();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          button.icon,
          size: (itemSeleccionado == this.index) ? 30 : 24,
          color: (itemSeleccionado == this.index) ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _menuModel with ChangeNotifier {
  
  int _indexSelecionado = 0;

  int get indexSelecionado => _indexSelecionado;

  set indexSelecionado(int indexSelecionado) {
    this._indexSelecionado = indexSelecionado;
    notifyListeners();
  }

}