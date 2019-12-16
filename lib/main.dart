import 'package:flutter/material.dart';
import 'package:pers_exp_mon/widgets/new_transaction.dart';
import 'package:pers_exp_mon/widgets/transaction_list.dart';
import 'package:pers_exp_mon/widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Recorder'),
      ),
      body: SingleChildScrollView(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
              ),
              width: double.infinity,
            ),
            User_Transactions()
          ],
        ),
      ),
    );
  }
}
