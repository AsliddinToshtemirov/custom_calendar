import 'package:custom_calendar/model/date_model.dart';
import 'package:custom_calendar/presentation/widgets/calendar_header.dart';
import 'package:custom_calendar/presentation/widgets/calendar_item.dart';
import 'package:custom_calendar/presentation/widgets/no_item.dart';
import 'package:custom_calendar/utils/app_utils.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final List<String> dayTitle = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  var selectedMonth = DateTime.now();
  DateData? currentSelectedDate;

  @override
  Widget build(BuildContext context) {
    final days = AppUtils.getDayByMonth(selectedMonth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Calendar Text
              const SizedBox(height: 20),
              const Text(
                'Calendar',
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Plan your week',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Calendar Header with month and year text and arrow buttons
              CalendarHeader(
                onLeftClick: () {
                  setState(() {
                    selectedMonth =
                        DateTime(selectedMonth.year, selectedMonth.month - 1);
                  });
                },
                onRightClick: () {
                  setState(() {
                    selectedMonth =
                        DateTime(selectedMonth.year, selectedMonth.month + 1);
                  });
                },
                selectedMonth: selectedMonth,
              ),
              //Custom Calendar with days of week and dates of month in grid view format
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: dayTitle
                          .map((e) => Text(
                                e,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  //Bold
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                          .toList(),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final item = days[index];
                        return CalendarItem(
                          item: item,
                          currentSelectedDate: currentSelectedDate,
                          onTap: () {
                            if (item.prevMonth) {
                              selectedMonth = DateTime(
                                  selectedMonth.year, selectedMonth.month - 1);
                            } else if (item.nextMonth) {
                              selectedMonth = DateTime(
                                  selectedMonth.year, selectedMonth.month + 1);
                            }
                            currentSelectedDate = item;
                            setState(() {});
                          },
                        );
                      },
                      itemCount: days.length,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "What's on ${AppUtils.formatDate(currentSelectedDate?.dateObj ?? DateTime.now())}",
                style: const TextStyle(
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = currentSelectedDate?.notes[index];
                  if (item == null) {
                    return const SizedBox();
                  }
                  return NoteItem(item: item);
                },
                itemCount: currentSelectedDate?.notes.length ?? 0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
