import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const textStyle=TextStyle(fontSize: 20);
    return MaterialApp(
      title: "StatelessWidget与基础组件",
      theme: ThemeData(
        primaryColor: Colors.orangeAccent
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidget与基础组件"),
          leading: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Text("I am a Text",style: textStyle,),
              Icon(Icons.android,size: 50,color: Colors.blue,),
              CloseButton(),
              BackButton(),
              Chip(
                avatar:Icon(Icons.pages),
                label: Text("StatelessWidget与基础组件"),
              ),
              Divider(
                color: Colors.pinkAccent,
                height: 10,
                indent: 20,
              ),
              Card(
                color: Colors.blue,
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("Card使用",style: textStyle,),
                ),
              ),
              AlertDialog(
                title: Text("盘他"),
                content: Text("你个糟老头子坏的很！！！"),
              )
            ],
          ),
        ),
      ),
    );
  }

}