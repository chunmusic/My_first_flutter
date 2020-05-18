import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/Models/transaction.dart';
import 'package:flutter_test_project/Widgets/user_transaction.dart';
import 'package:flutter_test_project/context.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_test_project/tab_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomePage(title: 'Flutter Demo Home Page'),
        UserTransactions.routeName: (ctx) => UserTransactions(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        //   TabsScreen.routeName: (ctx) => TabsScreen()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  int _counter = 0;
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: 180.0).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  var titleController;

  addIntToSF() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.getInstance().then((value) {
      SharedPreferences prefs = value;
      prefs.setInt('intValue', 123);
      prefs.setBool('isLogin', true);
      prefs.setString('username', 'username');
    });
  }

  trueLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.getInstance().then((value) {
      SharedPreferences prefs = value;
      prefs.setBool('isLogin', true);
    });
  }

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

  Future<int> getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int testval = prefs.getInt('intValue');
    print("login = $testval");
    return testval;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.grey, Colors.white])),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Welcome ",
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 40, bottom: 40),
                    ),
                    Container(
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(fontSize: 36, color: Colors.black),
                        ),
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      margin: EdgeInsets.only(left: 20, right: 20),
                    ),
                    Container(
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 36, color: Colors.black),
                        ),
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      margin: EdgeInsets.only(left: 20, right: 20),
                    ),
                    Text(
                      " ",
                      style: TextStyle(fontSize: 30),
                    ),
                    GFButton(
                      onPressed: () {
                        trueLogin();
                        Navigator.of(context)
                            .pushNamed(TabsScreen.routeName, arguments: {
                          'id': 'xx',
                          'title': 'yy',
                        });
                        getCheckLogin();
                      },
                      text: "Log in",
                      shape: GFButtonShape.pills,
                      blockButton: true,
                      size: GFSize.LARGE,
                    ),
                    GFButton(
                      onPressed: () {
                        http
                            .get(
                                "https://labtest-670a0.firebaseio.com/rating.json")
                            .then((response) {
                          print(response.body);
                        });
                      },
                      text: "TEST HTTP GET",
                      shape: GFButtonShape.pills,
                      blockButton: true,
                      size: GFSize.LARGE,
                    ),
                    GFButton(
                      onPressed: () {
                        // http
                        //     .post(
                        //         "https://labtest-670a0.firebaseio.com/rating.json",
                        //         body: json.encode(
                        //             {'name': 'id1', 'rating': '222222'}))
                        //     .then((response) {
                        // }

                        // );
                      },
                      text: "TEST HTTP POST",
                      shape: GFButtonShape.pills,
                      blockButton: true,
                      size: GFSize.LARGE,
                    ),
                    GFButton(
                      onPressed: () {
                        addIntToSF();
                      },
                      text: "Add Shared_Perferences",
                      shape: GFButtonShape.pills,
                      blockButton: true,
                      size: GFSize.LARGE,
                    ),
                    GFButton(
                      onPressed: () {
                        getIntValuesSF();
                      },
                      text: "Get Shared_Perferences",
                      shape: GFButtonShape.pills,
                      blockButton: true,
                      size: GFSize.LARGE,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: _arrowAnimationController,
                          builder: (context, child) => Transform.rotate(
                            angle: _arrowAnimation.value,
                            child: Icon(
                              Icons.expand_more,
                              size: 50.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        OutlineButton(
                          color: Colors.white,
                          textColor: Colors.black,
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Start Icon Animation'),
                          onPressed: () {
                            _arrowAnimationController.isCompleted
                                ? _arrowAnimationController.reverse()
                                : _arrowAnimationController.forward();
                          },
                          splashColor: Colors.red,
                        )
                      ],
                    ),
                  ]))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            http
                .get("https://labtest-670a0.firebaseio.com/rating.json")
                .then((response) {
              print(response.body);

              final extractedData =
                  json.decode(response.body) as Map<String, dynamic>;
              final List<Transaction> transaction = [];

              extractedData.forEach((prodId, prodData) {
                transaction
                    .add(Transaction(name: 'Best Movie', rating: '9.9'));
              });
              print(transaction);
            });

            Navigator.of(context)
                .pushNamed(UserTransactions.routeName, arguments: {
              // 'name': 'xx',
              // 'rating': 'yy',
            });
          },
          tooltip: 'Increment',
          child: Text('Transaction')),
    );
  }
}
