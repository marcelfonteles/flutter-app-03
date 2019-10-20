import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState(appBarTitle: "Flutter App");
  }
}

class HomePageState extends State<HomePage> {
  final String appBarTitle;

  HomePageState({this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            width: 360,
            child: Card(
              child: Text("This is cross axis on Column"),
              color: Colors.blue,
              elevation: 5.0,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 621,
                width: 50,
                child: Card(
                  child: Text("This is main axis on Column"),
                  color: Colors.red,
                  elevation: 5.0,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
