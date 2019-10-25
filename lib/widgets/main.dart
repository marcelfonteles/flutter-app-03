// Base Import

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

// My Files
import "./new_transaction.dart";
import "../models/transaction.dart";
import "./transactions_list.dart";
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Expenses App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.black,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
          button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState(appBarTitle: "My Expenses App");
  }
}

class HomePageState extends State<HomePage> {
  final String appBarTitle;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  HomePageState({this.appBarTitle});

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1',
        title: 'New Hardware',
        amount: 1289.99,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 'T2',
        title: 'New Sneakers',
        amount: 289.99,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 'T3',
        title: 'New Phone',
        amount: 1589.99,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 'T4',
        title: 'New Notebook',
        amount: 89.99,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 'T5',
        title: 'New Shoes',
        amount: 199.99,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 'T6',
        title: 'New Pants',
        amount: 89.99,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: 'T7',
        title: 'New Smartphone',
        amount: 1589.99,
        date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(
        id: 'T8',
        title: 'New Headphones',
        amount: 289.99,
        date: DateTime.now().subtract(Duration(days: 7))),
    Transaction(
        id: 'T9',
        title: 'New Something',
        amount: 1289.99,
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double amount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Chart(_recentTransactions),
          _userTransactions.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sem transacoes",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
      bottomNavigationBar: Container(
        height: 40,
        child: BottomAppBar(
          color: Colors.purple[800],
        ),
      ),
    );
  }
}
