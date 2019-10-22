import "package:flutter/material.dart";

class TransactionCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  TransactionCard({
    this.title,
    this.amount,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xebebebeb),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 20),
              child: Column(
                children: <Widget>[
                  Text("\$ " + this.amount.toString()),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.title),
                  Text(this.date.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
