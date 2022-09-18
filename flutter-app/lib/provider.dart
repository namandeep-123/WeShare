import 'package:flutter/material.dart';



class Counter with ChangeNotifier{
  int _count = 0;
  List _newarr=[];

  int get count => _count;
  List get cart=> _newarr;

  void increment(Widget feedpage) {
    _count++;
    _newarr.add(feedpage);
    notifyListeners();
  }


}