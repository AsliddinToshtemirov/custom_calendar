import 'package:custom_calendar/utils/app_utils.dart';
import 'package:flutter/material.dart';

// calendar ni Header i

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.onLeftClick,
    required this.onRightClick,
    required this.selectedMonth,
  });

  final VoidCallback onLeftClick;
  final VoidCallback onRightClick;
  final DateTime selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
            onPressed: onLeftClick,
          ),
          Expanded(
              child: Text(
            AppUtils.formatMonth(selectedMonth),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                color: Colors.white, size: 16),
            onPressed: onRightClick,
          ),
        ],
      ),
    );
  }
}
