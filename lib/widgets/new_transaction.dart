import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class New_Transaction extends StatefulWidget {
  final Function addTx;

  New_Transaction(this.addTx);

  @override
  _New_TransactionState createState() => _New_TransactionState();
}

class _New_TransactionState extends State<New_Transaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectDate;

  void _submitData() {
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      selectDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 7)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectDate = pickedDate;
      });
    });
    print('...');
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
                onSubmitted: (_) => _submitData(),
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
              onSubmitted: (_) => _submitData(),

              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(selectDate == null
                        ? 'No Date chosen!'
                        : 'Picked Date ' +
                            DateFormat.yMEd().format(selectDate).toString()),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
