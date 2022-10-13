import 'dart:math';

import 'package:custom_calendar/model/date_model.dart';
import 'package:custom_calendar/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String formatTime(DateTime date) {
    return DateFormat('hh:mm').format(date);
  }

  static List<DateData> getDayByMonth(DateTime date) {
    //Nechi kunligini olish // Get Number of days
    final int daysInMonth = DateTime(date.year, date.month + 1, 0).day;

    //Kunni olish // Get the day
    final int firstDayOfMonth = DateTime(date.year, date.month, 1).weekday;

    // O'tgan oyni birinch kunini olish //Get Previous last firstDayOfMonth days
    final int previousMonthDays = DateTime(date.year, date.month, 0).day;
    final prevLastDate = previousMonthDays - firstDayOfMonth + 1;
    final result = <DateData>[];
    //O'tkan oyni qo'shish // Add Previous Month Days
    for (var i = prevLastDate; i <= previousMonthDays; i++) {
      result.add(
        DateData(
          dateObj: DateTime(date.year, date.month - 1, i),
          day: "$i",
          prevMonth: true,
        ),
      );
    }

    // for add event // event qo'shish uchun

    for (var i = 1; i <= daysInMonth; i++) {
      result.add(
        DateData(
          dateObj: DateTime(date.year, date.month, i),
          day: "$i",
          notes: i == 21 || i == 12
              ? [
                  Note(
                    title: "Make calendar For task ",
                    description: "Description",
                    date: DateTime.now(),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                ]
              : [],
        ),
      );
    }

    int lastDayOfMonth = DateTime(date.year, date.month + 1, 0).weekday + 1;
    if (lastDayOfMonth > 7) {
      lastDayOfMonth = 1;
    }
    final int nextMonthDays = 7 - lastDayOfMonth;

    for (var i = 1; i <= nextMonthDays; i++) {
      result.add(
        DateData(
          dateObj: DateTime(date.year, date.month + 1, i),
          day: "$i",
          nextMonth: true,
        ),
      );
    }
    return result;
  }

  static String formatMonth(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
