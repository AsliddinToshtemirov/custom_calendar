import 'package:custom_calendar/model/day_color.dart';
import 'package:custom_calendar/service/color_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorFetchProvider = FutureProvider<List<ColorDays>>((ref) async {
  return ref.read(apiProvider).getColor();
});
