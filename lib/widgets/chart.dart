import 'package:flutter/material.dart';
import 'package:pers_exp_mon/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:pers_exp_mon/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6,
      
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: groupTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['day'],
                  spendingAmount: data['amount'],
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList()),
      ),
    );
  }
}
