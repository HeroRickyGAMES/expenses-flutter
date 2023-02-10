import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import '/components/transaction_form.dart';
import 'components/transaction_list.dart';
import '/models/transaction.dart';
//Programado por HeroRickyGames

main(){
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MYHomePage(),
    );
  }
}

class MYHomePage extends StatefulWidget {

  MYHomePage({Key? key}) : super(key: key);

  @override
  State<MYHomePage> createState() => _MYHomePageState();
}

final _transactions = [
  Transaction(
    id: 't1',
    title: 'Novo Tenis de corrida',
    value: 310.76,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't2',
    title: 'Conta de luz',
    value: 211.30,
    date: DateTime.now(),
  ),
];



class _MYHomePageState extends State<MYHomePage> {
  _addTransactions(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();

  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransactions);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: [
          IconButton(onPressed: () => _openTransactionFormModal(context),
           icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Gráfico'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child:
        Icon(
            Icons.add
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

