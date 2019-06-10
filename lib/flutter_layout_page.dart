import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlutterLayoutPageState();
  }
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  static const textStyle = TextStyle(fontSize: 20);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何进行Flutter布局开发",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何进行Flutter布局开发"),
          leading: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),

        //底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: Text("列表"),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Text("点我"),
          onPressed: null,
        ),
        //RefreshIndicator 下拉刷新 一定要嵌套一个列表
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.network(
                                      "http://b269.photo.store.qq.com/psb?/7746bf1e-e59a-4e3d-92ca-698ffaefcb6d/7LlJizPwCgHMIGZ42pIwMYVp5hL8pD59sCToPwbxPY8!/b/dA0BAAAAAAAA&bo=6AM2BegDNgURBzA!&rf=viewer_4"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                      opacity: 0.6,
                                      child: Container(
                                        color: Colors.blue,
                                        child: Image.network(
                                          "http://b269.photo.store.qq.com/psb?/7746bf1e-e59a-4e3d-92ca-698ffaefcb6d/7LlJizPwCgHMIGZ42pIwMYVp5hL8pD59sCToPwbxPY8!/b/dA0BAAAAAAAA&bo=6AM2BegDNgURBzA!&rf=viewer_4",
                                          width: 100,
                                          height: 100,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                          Image.network(
                            "http://b269.photo.store.qq.com/psb?/7746bf1e-e59a-4e3d-92ca-698ffaefcb6d/7LlJizPwCgHMIGZ42pIwMYVp5hL8pD59sCToPwbxPY8!/b/dA0BAAAAAAAA&bo=6AM2BegDNgURBzA!&rf=viewer_4",
                            width: 100,
                            height: 100,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                hintText: "请输入",
                                hintStyle: TextStyle(fontSize: 20)),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 100,
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: <Widget>[
                                  _itemPage("page1", Colors.redAccent),
                                  _itemPage("page2", Colors.yellowAccent),
                                  _itemPage("page3", Colors.greenAccent),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  color: Colors.orangeAccent,
                                  child: Text("宽度撑满"),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              Image.network(
                                "http://b269.photo.store.qq.com/psb?/7746bf1e-e59a-4e3d-92ca-698ffaefcb6d/7LlJizPwCgHMIGZ42pIwMYVp5hL8pD59sCToPwbxPY8!/b/dA0BAAAAAAAA&bo=6AM2BegDNgURBzA!&rf=viewer_4",
                                width: 200,
                                height: 200,
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Image.network(
                                  "http://b269.photo.store.qq.com/psb?/7746bf1e-e59a-4e3d-92ca-698ffaefcb6d/7LlJizPwCgHMIGZ42pIwMYVp5hL8pD59sCToPwbxPY8!/b/dA0BAAAAAAAA&bo=6AM2BegDNgURBzA!&rf=viewer_4",
                                  width: 70,
                                  height: 70,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Wrap(
                spacing: 8,
                runSpacing: 6,
                children: <Widget>[
                  _chip("Flutter"),
                  _chip("Kotlin"),
                  _chip("Yangxiangjie"),
                  _chip("Java"),
                  _chip("Python")
                ],
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _itemPage(String title, Color color) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 36),
        ),
      ),
      decoration: BoxDecoration(color: color),
    );
  }

  _chip(String s) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.orangeAccent,
        child: Text(
          s.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
      label: Text(s),
    );
  }
}
