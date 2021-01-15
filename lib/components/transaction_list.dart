import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weekly_finance_app/components/transaction_item.dart';
import 'package:weekly_finance_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.2,
                    child: Text(
                      'Nenhuma transação cadastrada',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                ],
              );
            },
          )
        :
        // ListView(
        //     children: transactions.map((tr) {
        //       return TransactionItem(
        //         key: ValueKey(tr.id),
        //         tr: tr,
        //         onRemove: onRemove,
        //       );
        //     }).toList(),
        //   );

        ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr.id),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
