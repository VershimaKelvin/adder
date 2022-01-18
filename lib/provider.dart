import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Backend with ChangeNotifier{
  int value=0;

  Backend(){
    puff();
  }

  puff()async{
    value= await getSavedNumber();
    notifyListeners();
  }

  void addNumber(){
    value++;
    notifyListeners();
    setValue();

  }

  void subtractNumber(){
    value--;
    notifyListeners();
    setValue();
  }

  getSavedNumber()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('value')??0;
  }

  setValue()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('value', value);
    notifyListeners();
  }

   deletePreferences()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value=0;
    prefs.remove('value');
    notifyListeners();
  }

}