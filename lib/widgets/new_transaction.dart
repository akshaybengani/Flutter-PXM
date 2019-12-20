import 'package:flutter/material.dart';

class New_Transaction extends StatefulWidget {
  final Function addTx;

  New_Transaction(this.addTx);

  @override
  _New_TransactionState createState() => _New_TransactionState();
}

class _New_TransactionState extends State<New_Transaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() { 
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
                controller: titleController,
                onSubmitted: (_) => submitData(),
                //  onChanged: (val) {
                //    titleInput = val;
                //  },
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount', border: OutlineInputBorder()),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),

              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
