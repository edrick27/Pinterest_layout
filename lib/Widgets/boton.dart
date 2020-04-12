import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Boton extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const Boton({
    this.texto = "", 
    this.icon = FontAwesomeIcons.question, 
    this.color1 = Colors.blue, 
    this.color2 = Colors.blueGrey,
    @required this.onPress
  });

  

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BotonBackground(
            icon: this.icon,
            color1: this.color1,
            color2: this.color2
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140, width: 40),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40
              ),
              SizedBox(width: 20),
              Expanded(child: Text(this.texto, style: TextStyle( color: Colors.white, fontSize: 18) )),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
                size: 40
              ), 
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;
  
  _BotonBackground({
    @required this.icon, 
    @required this.color1, 
    @required this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )

          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10)
        ],
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2
          ]
        )
      )
    );
  }
}