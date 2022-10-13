import 'package:custom_calendar/common/color.dart';
import 'package:custom_calendar/model/date_model.dart';
import 'package:custom_calendar/provider/day_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//calendar ichida yozilgan sanalar vidgeti

class CalendarItem extends ConsumerWidget {
  const CalendarItem({
    super.key,
    required this.item,
    required this.currentSelectedDate,
    required this.onTap,
  });
  final DateData item;
  final DateData? currentSelectedDate;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getColor = ref.watch(colorFetchProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.2),
        decoration: BoxDecoration(
          color: currentSelectedDate?.dateObj == item.dateObj
              ? itemPressedColor
              : (item.day == "21" || item.day == "12"
                  ? const Color.fromARGB(255, 51, 255, 0)
                  : (item.day == "1" || item.day == "18")
                      ? Colors.yellow
                      : (item.day == "15" ||
                              item.day == "20 " ||
                              item.day == "22" ||
                              item.day == "25" ||
                              item.day == "27" ||
                              item.day == "29")
                          ? Colors.grey
                          : itemNotPressed),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: item.notes.isNotEmpty ? 1 : 0,
              child: Container(
                height: 5,
                width: 5,
                decoration: const BoxDecoration(
                  color: markColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text(
              item.day.toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: (item.prevMonth || item.nextMonth)
                      ? const Color.fromARGB(255, 217, 212, 212)
                      : const Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
