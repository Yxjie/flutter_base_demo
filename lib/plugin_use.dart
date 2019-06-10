import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class PluginUse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "插件使用",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("插件使用"),
          leading: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("插件使用修改颜色",style: TextStyle(
                color: ColorUtil.color("#aaaaff")
              ),)
            ],
          ),
        ),
      ),
    );
  }

}