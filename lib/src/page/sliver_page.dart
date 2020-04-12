import 'package:flutter/material.dart';


class SliverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BottonNewList()
          )
        ],
      )
   );
  }
}

class _BottonNewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      height: 100,
      minWidth: size.width * 0.9,
      child: RaisedButton(
        onPressed: (){},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(50) )
        ),
        child: Text(
          'Create New List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  _MainScroll();

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      slivers: <Widget>[

        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Titulo'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo()
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate(items)
        )

      ],
    );
  }
}
          
class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    this.minHeight,
    this.maxHeight,
    this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent =>  this.minHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    
    return (this.maxHeight != oldDelegate.maxHeight) ||
           (this.minHeight != oldDelegate.minHeight) ||
           (this.child != oldDelegate.child);
  }

}

class _Titulo extends StatelessWidget {
  
  _Titulo();

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric( horizontal: 30, vertical: 10),
          child: Text('New', style: TextStyle(color: Color(0xFF532128), fontSize: 50)),
        ),
        Stack(
          children: <Widget>[
            SizedBox( width: 100 ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF20A842)
                ),
              ),
            ),
            Text('List', style: TextStyle(color: Color(0xFFFF2E4A), fontSize: 50)),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

    final items = [
      _ListItem( 'Orange', Color(0xffF08F66) ),
      _ListItem( 'Family', Color(0xffF2A38A) ),
      _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
      _ListItem( 'Books', Color(0xffFCEBAF) ),
      _ListItem( 'Orange', Color(0xffF08F66) ),
      _ListItem( 'Family', Color(0xffF2A38A) ),
      _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
      _ListItem( 'Books', Color(0xffFCEBAF) ),
    ];

  _ListaTareas();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int i) {

        return items[i];

      }
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String texto;
  final Color color;

  _ListItem( this.texto,  this.color );


  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(this.texto, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold )),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}