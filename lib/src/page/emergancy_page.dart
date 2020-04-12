import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest_layout/Widgets/boton.dart';
import 'package:pinterest_layout/Widgets/iconHeaders.dart';


class EmergancyPage extends StatelessWidget {

  
  final items = <ItemBoton>[
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  ];


  @override
  Widget build(BuildContext context) {

     List listBotons = items.map(
      (item) => Boton( 
        icon: item.icon, 
        texto: item.texto, 
        color1: item.color1, 
        color2: item.color2, 
        onPress: (){ print("opn tap"); } 
      )
     ).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only( top: 250 ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 50),
                ...listBotons
              ]
            ),
          ),
          PageHeader()
        ],
      )
   );
  }

}

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class PageHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeaders(
          titulo: "Asistencia medica",
          subtitulo: "Haz solicitado",
          icon: FontAwesomeIcons.plus,
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2)
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV, color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

}

