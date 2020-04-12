import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class IconHeaders extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeaders({
    @required this.icon, 
    @required this.titulo,
    @required this.subtitulo, 
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey
  });
            

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);
    
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        
        Positioned(
          child: FaIcon(
            this.icon,
            size: 250,
            color: colorBlanco
          ),
          top: -80,
          left: -70
        ),

         Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity),
            Text(this.subtitulo,style: TextStyle( fontSize: 20,  color: colorBlanco)),
            SizedBox(height: 20),
            Text(this.titulo,style: TextStyle( fontSize: 25,  color: colorBlanco, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 80, color: Colors.white)
          ],
        ),
      ],
    );
  }

}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  
  _IconHeaderBackground({
    @required this.color1,
    @required this.color2
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:  <Color>[
            this.color1,
            this.color2
          ]
        )
      )
    );
  }
}