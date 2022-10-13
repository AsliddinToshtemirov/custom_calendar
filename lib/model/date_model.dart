import 'package:custom_calendar/model/note_model.dart';

//calendar model
class DateData {
  final DateTime dateObj;
  final bool selected;
  final bool prevMonth;
  final bool nextMonth;
  final String day;
  final List<Note> notes;

  DateData({
    required this.dateObj,
    this.notes = const [],
    this.selected = false,
    this.prevMonth = false,
    this.nextMonth = false,
    required this.day,
  });
}
