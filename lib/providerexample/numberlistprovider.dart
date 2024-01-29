import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier{

 List<int> numbers = [1, 2, 3, 4, 5, 6];

  void addNumbers(){
     numbers.add(numbers.last+1);
     notifyListeners();

  }




}