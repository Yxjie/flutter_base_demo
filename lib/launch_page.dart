import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "打开第三方应用",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("打开第三方应用"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _launchURL(),
                child: Text("打开浏览器"),
              ),
              RaisedButton(onPressed: ()=>_openMap(),child: Text("打开地图"),)
            ],
          ),
        ),
      ),
    );
  }

  //打开浏览器
  _launchURL() async {
    const url = 'https://www.jianshu.com/u/4348c255f36d';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //打开地图
  _openMap() async {
    //Android
    const url = "geo:52.32,4.917";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //ios
      const url = "http://maps.apple.com?ll=52.32,4.917";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
