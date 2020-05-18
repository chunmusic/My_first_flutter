import 'package:flutter/material.dart';
import 'package:flutter_test_project/main-learning1.dart';
import 'package:getflutter/getflutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  falseLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.getInstance().then((value) {
      SharedPreferences prefs = value;
      prefs.setBool('isLogin', false);
    });
  }

  Future<bool> getCheckLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checklogin = prefs.getBool('isLogin');
    print("test $checklogin");
    return checklogin;
  }

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print("args");
    print(args);
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Bar'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Test1',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Test2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Hello Imaizumi Yui",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.cyan,
                  ),
                ),
                Center(
                    child: (Image.network(
                        "https://i.mydramalist.com/1qvV5c.jpg"))),
                GFButton(
                  onPressed: () {
                    falseLogin();
                    Navigator.pop(context);
                    getCheckLogin();
                  },
                  text: "Log out",
                  shape: GFButtonShape.pills,
                  blockButton: true,
                  size: GFSize.LARGE,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Hello paruru",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                  ),
                ),
                Center(child: (Image.asset("./assets/images/paruru.jpg"))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
