import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TranasctionList extends StatelessWidget {
  //name({Key key}) : super(key: key);

  final List<Transaction> transaction;
  final Function delTX;

  TranasctionList(this.transaction,this.delTX);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
        child: ListView.builder(
          itemBuilder: (ctx,index){
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 3)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      transaction[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction[index].title,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(transaction[index].currency, style: TextStyle(fontSize: 15)),
                      Text(
                        DateFormat.yMMMd().add_jm().format(transaction[index].date),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  IconButton(color: Colors.red, icon: Icon(Icons.delete),onPressed: () => delTX(transaction[index].id) ,)
                ],
              ),
            );

          },
          itemCount:transaction.length,
        ),
      
    );
  }
}
