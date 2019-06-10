import 'package:flutter/material.dart';

class ResUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "如何导入和引用资源",
        home: Scaffold(
          appBar: AppBar(
            title: Text("如何导入和引用资源"),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                "images/ic.jpeg",
              ),
            ),
          ),
        ));
  }
}
