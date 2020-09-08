import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  int first;
  int second;
  String text = "";
  String res;
  String op;
  void btnclicked(String val) {
    if (val == "C") {
      first = 0;
      second = 0;
      text = "";
      res = "";
    } else if (val == "+" || val == "-" || val == "x" || val == "/") {
      first = int.parse(text);
      res = "";
      op = val;
    } else if (val == "=") {
      second = int.parse(text);
      if (op == "+") {
        res = (first + second).toString();
      }
      if (op == "-") {
        res = (first - second).toString();
      }
      if (op == "x") {
        res = (first * second).toString();
      }
      if (op == "/") {
        res = (first / second).toString();
      }
    } else {
      res = int.parse(text + val).toString();
    }
    setState(() {
      text = res;
    });
  }

  Widget custombutton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(val),
        child: Text(
          "$val",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$text",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
