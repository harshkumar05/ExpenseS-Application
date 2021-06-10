import 'package:flutter/material.dart';
import 'package:project3/widgets/chart.dart';
import 'package:project3/widgets/new_transaction.dart';
import 'package:project3/widgets/transactionList.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpeneseS',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.teal
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      currency: 'USD',
      amount: 59.61,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      currency: 'INR',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'First AID',
      currency: 'USD',
      amount: 27.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, String txCurrency, double txAmount) {
    final newTX = Transaction(
      title: txTitle,
      currency: txCurrency,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTX);
    });
  }

  List <Transaction> get _recentTransactions{
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (btx) {
        return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id)
  {
      setState(() {
            _userTransaction.removeWhere((tx) => tx.id == id);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense it'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TranasctionList(_userTransaction,_deleteTransaction),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
