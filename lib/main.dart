import 'package:adder/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(  MaterialApp(
      home:ChangeNotifierProvider<Backend>(
          create: (BuildContext context)=>Backend(),
        child: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;

  @override
  void initState() {
    value=Provider.of<Backend>(context).getSavedNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title:const Text('Adder')
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Container(
                    color: Colors.grey,
                    child: FlatButton(
                      onPressed: (){
                        Provider.of<Backend>(context,listen: false).subtractNumber(value);
                      },
                      child: const Text('-'),),
                  ),
                  Text(value.toString()),
                  Container(
                    color: Colors.grey,
                    child: FlatButton(
                      onPressed: (){
                        Provider.of<Backend>(context,listen: false).addNumber(value);
                      },
                      child: const Text('+'),),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
