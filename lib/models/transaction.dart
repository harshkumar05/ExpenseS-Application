import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final String currency;
  final double amount;
  final DateTime date;

  Transaction({
     @required this.id,
     @required this.title,
     @required this.currency,
     @required this.amount,
     @required this.date,
  }
  );
}
