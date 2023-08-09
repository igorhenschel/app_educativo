import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './TransactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: transactions.isEmpty
              ? LayoutBuilder(builder: (ctx, constraints) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Nenhuma Transação Cadastrada!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                })
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (ctx, index) {
                    final tr = transactions[index];
                    return TransactionItem(
                      tr: tr,
                      onRemove: onRemove,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
