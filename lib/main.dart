import 'package:expenses_app/transaction.dart';
import "package:flutter/material.dart";
import "./transaction.dart";
import "package:intl/intl.dart";
import "./transactionCard.dart";

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

  final List<Transaction> transactions = [
    Transaction(
      id: "T1",
      title: "New Hardware",
      amount: 178.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T2",
      title: "New Machine",
      amount: 2999.99,
      date: DateTime.now(),
    )
  ];

  HomePageState({this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                TextField(),
                TextField(),
              ],
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              elevation: 3.0,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "\$${transaction.amount} ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat("dd/MM/yyyy - HH:mm")
                            .format(transaction.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
