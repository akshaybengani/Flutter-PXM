import 'package:flutter/material.dart';

class New_Transaction extends StatelessWidget {

  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  New_Transaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return  Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                   decoration: InputDecoration(labelText: 'Title'),
                   controller: titleController,
                  //  onChanged: (val) {
                  //    titleInput = val;
                  //  },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.purple,
                    onPressed: () {
                      addTx(titleController.text,double.parse(amountController.text));
                    },
                  ),
                ],
              ),
            ),
          );
  }
}