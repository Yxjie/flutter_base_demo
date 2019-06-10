import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SharedPreferencesUseState();
}

class _SharedPreferencesUseState extends State<SharedPreferencesUse> {
  String countString = "";
  String localCount = "";

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
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: _incrementCounter,
                child: Text("increment Counter"),
              ),
              RaisedButton(
                onPressed: _getCounter,
                child: Text("get Counter"),
              ),
              RaisedButton(
                onPressed: _clearCount,
                child: Text("clear counter"),
              ),
              Text(
                countString,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                localCount,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + " 1";
    });

    int counter = (sharedPreferences.getInt("counter") ?? 0) + 1;
    sharedPreferences.setInt("counter", counter);
  }

  _getCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      localCount = sharedPreferences.getInt("counter").toString();
    });
  }

  _clearCount() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      countString = "";
      localCount = "0";
    });
    sp.remove("counter");
  }
}
