import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  String msg = "";
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何检测用户手势以及处理点击事件",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何检测用户手势以及处理点击事件"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg("点击"),
                    onDoubleTap: () => _printMsg("双击"),
                    onLongPress: () => _printMsg("长按"),
                    onTapCancel: () => _printMsg("取消"),
                    onTapUp: (e) => _printMsg("松开"),
                    onTapDown: (e) => _printMsg("按下"),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        "Click me",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(msg)
                ],
              ),
              Positioned(
                child:GestureDetector(
                  onPanUpdate: (e)=>_moveCircle(e),
                  child:  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
                left: moveX,
                top: moveY,
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String s) {
    setState(() {
      msg += " $s";
    });
  }

  //更新小球位置
  _moveCircle(DragUpdateDetails e) {
    setState(() {
      moveY+=e.delta.dy;
      moveX+=e.delta.dx;
    });
  }
}
