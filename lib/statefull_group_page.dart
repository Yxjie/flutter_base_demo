import 'package:flutter/material.dart';

class StatefulGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<StatefulGroup> {
  static const textStyle = TextStyle(fontSize: 20);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatefulWidget与基础组件",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget与基础组件"),
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
                            margin: const EdgeInsets.only(top: 10),
                            decoration:
                                BoxDecoration(color: Colors.lightBlueAccent),
                            height: 200,
                            child: PageView(
                              children: <Widget>[
                                _itemPage("page1", Colors.redAccent),
                                _itemPage("page2", Colors.yellowAccent),
                                _itemPage("page3", Colors.greenAccent),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Text(
                "列表",
                style: textStyle,
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
}
