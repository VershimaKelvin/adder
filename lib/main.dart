import 'package:adder/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      Provider.of<Backend>(context,listen: false).subtractNumber();
                    },
                    child: const Text('-'),),
                ),
                Text(Provider.of<Backend>(context).value.toString()),
                Container(
                  color: Colors.grey,
                  child: FlatButton(
                    onPressed: (){
                      Provider.of<Backend>(context,listen: false).addNumber();
                    },
                    child: const Text('+'),),
                ),
              ],
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.red,
                child: FlatButton.icon(
                    onPressed:(){
                      Provider.of<Backend>(context).deletePreferences();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'delete',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
