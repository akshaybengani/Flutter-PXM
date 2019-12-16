import 'package:flutter/material.dart';
import 'package:pers_exp_mon/models/transaction.dart';
import 'package:pers_exp_mon/widgets/new_transaction.dart';
import 'package:pers_exp_mon/widgets/transaction_list.dart';

class User_Transactions extends StatefulWidget {
  @override
  _User_TransactionsState createState() => _User_TransactionsState();
}

class _User_TransactionsState extends State<User_Transactions> {
  final List<Transaction> userTransactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Burgur',
      amount: 30,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      userTransactions.add(newTx);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        New_Transaction(_addNewTransaction),
        TransactionList(userTransactions),
      ],
    );
  }
}
