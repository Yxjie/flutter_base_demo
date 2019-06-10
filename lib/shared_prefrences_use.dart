import 'package:flutter/material.dart';


class SharedPreferencesUse extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_SharedPreferencesUseState();

}

class _SharedPreferencesUseState extends State<SharedPreferencesUse>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "shared_preferences 插件使用",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("shared_preferences 插件使用"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: ()=> Navigator.pop(context),
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }

}