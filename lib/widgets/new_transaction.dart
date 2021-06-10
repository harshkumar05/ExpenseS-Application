import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //NewTransaction({Key? key}) : super(key: key);
  final Function addTX;
  NewTransaction(this.addTX);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //const NewTransaction({Key key}) : super(key: key);

  final titlecontroller = TextEditingController();
  final currencycontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime _selectDate;

  void _datePicker()
  {
    showDatePicker(context: context, 
    initialDate: DateTime.now(),
     firstDate: DateTime(2020), 
     lastDate: DateTime.now()).then((pickedDate){
       if(pickedDate==null)
       {
         return;
       }
       setState(() {
         _selectDate=pickedDate;
       });
       
     });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Currency'),
              controller: currencycontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
            //Navigator.of(context).pop();
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Text(_selectDate == null ? 'No date Chosen' : 'Picked Date${ DateFormat.yMd().format(_selectDate)}',),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _datePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Colors.purple,
              textColor: Colors.black,
              onPressed: () {
                widget.addTX(
                  titlecontroller.text,
                  currencycontroller.text,
                  double.parse(amountcontroller.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
