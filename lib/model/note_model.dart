import 'package:flutter/material.dart';

//note lar modeli // model of notes
class Note {
  final String title;
  final String description;
  final DateTime date;
  final Color color;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
