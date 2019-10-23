// Base Import
import "package:flutter/material.dart";

// My Files
import "./new_transaction.dart";
import "../models/transaction.dart";
import "./transactions_list.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Expenses App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.black,
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
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
    ),
    Transaction(
      id: "T3",
      title: "New Shoes",
      amount: 299.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T4",
      title: "New backpack",
      amount: 49.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T5",
      title: "New Headphones",
      amount: 119.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T6",
      title: "New Notebook",
      amount: 5.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T7",
      title: "New Coffee Maker",
      amount: 119.89,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
      title: txTitle,
      amount: amount,
      date: DateTime.now(),
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
          TransactionList(_userTransactions),
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
