import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Backend with ChangeNotifier{


  void addNumber(int value){
    value++;
    setValue(value);
  }

  void subtractNumber(int value){
    value--;
    setValue(value);
  }

  getSavedNumber()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('value')??0;
  }

  setValue(int value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('value', value);
  }

}