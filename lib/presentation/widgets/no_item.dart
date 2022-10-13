import 'package:custom_calendar/model/note_model.dart';
import 'package:custom_calendar/utils/app_utils.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Note item;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    AppUtils.formatTime(item.date),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: item.color.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "My calendar",
                      style: TextStyle(
                        fontSize: 12,
                        color: item.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
