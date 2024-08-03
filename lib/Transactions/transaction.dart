import "package:flutter/material.dart";


class Transaction {
  final String title;
  String? category;
  final String description;
  final String amount;

   Transaction({
    required this.title,  this.category ,required this.amount ,required this.description
  });
}