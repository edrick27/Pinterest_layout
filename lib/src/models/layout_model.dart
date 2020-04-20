import 'package:flutter/material.dart';
import 'package:pinterest_layout/src/page/pinterest_page.dart';

class LayoutModel with ChangeNotifier {

  Widget _currenPage = PinterestPage();

  set currentPage(Widget currentPage){

    _currenPage = currentPage;
    notifyListeners();
  }

  Widget get currentPage => _currenPage;
  
  
}