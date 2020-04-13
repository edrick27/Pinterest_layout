import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:pinterest_layout/src/page/emergancy_page.dart';
import 'package:pinterest_layout/src/page/pinterest_page.dart';
import 'package:pinterest_layout/src/page/sliver_page.dart';


final pageRoutes = <_Route>[

  _Route(icon: FontAwesomeIcons.ambulance, titulo: 'Emergencia', page: EmergancyPage()),
  _Route(icon: FontAwesomeIcons.pinterest, titulo: 'Pinterest', page: PinterestPage()),
  _Route(icon: FontAwesomeIcons.mobile, titulo: 'Slivers', page: SliverPage())


];

class _Route {
  
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route({
    this.icon,
    this.titulo,
    this.page,
  });

}
