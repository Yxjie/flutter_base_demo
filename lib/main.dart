import 'package:flutter/material.dart';
import 'package:flutter_base_demo/gesture_page.dart';
import 'package:flutter_base_demo/shared_prefrences_use.dart';
import 'plugin_use.dart';
import 'package:flutter_base_demo/less_group_page.dart';
import 'package:flutter_base_demo/statefull_group_page.dart';
import 'package:flutter_base_demo/flutter_layout_page.dart';
import 'package:flutter_base_demo/res_use_page.dart';
import 'package:flutter_base_demo/launch_page.dart';
import 'package:flutter_base_demo/photo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //路由表
      routes: <String, WidgetBuilder>{
        "plugin": (BuildContext context) => PluginUse(),
        "less": (BuildContext context) => LessGroupPage(),
        "stateful": (BuildContext context) => StatefulGroup(),
        "layout": (BuildContext context) => FlutterLayoutPage(),
        "gesture": (BuildContext context) => GesturePage(),
        "res": (BuildContext context) => ResUsePage(),
        "launch": (BuildContext context) => LaunchPage(),
        "photo": (BuildContext context) => PhotoPage(),
        "shared_preferences":(context)=>SharedPreferencesUse(),
      },
      home: RouterPage(title: 'Flutter Demo'),
    );
  }
}

class RouterPage extends StatefulWidget {

  final String title;
  RouterPage({Key key, this.title}) : super(key: key);

  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SwitchListTile(
                  title: Text('${byName ? '' : '不'}通过路由名跳转'),
                  value: byName,
                  onChanged: (value) {
                    setState(() {
                      byName = value;
                    });
                  }),
              _item("插件使用", PluginUse(), "plugin"),
              _item("StatelessWidget与基础组件", LessGroupPage(), "less"),
              _item("StatefulWidget与基础组件", StatefulGroup(), "stateful"),
              _item("如何进行Flutter布局开发", FlutterLayoutPage(), "layout"),
              _item("如何检测用户手势以及处理点击事件", GesturePage(), "gesture"),
              _item("如何导入和引用资源", ResUsePage(), "res"),
              _item("打开第三方应用", LaunchPage(), "launch"),
              _item("拍照App", PhotoPage(), "photo"),
              _item("shared_preferences 插件使用", SharedPreferencesUse(), "shared_preferences"),

            ],
          ),
        ));
  }

  _item(String s, page, String routerName) {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 1,
        child: RaisedButton(
          onPressed: () {
            if (byName) {
              Navigator.pushNamed(context, routerName);
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            }
          },
          child: Text(s),
        ),
      ),
    );
  }
}
