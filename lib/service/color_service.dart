import 'dart:convert';

import 'package:custom_calendar/common/api_constanta.dart';
import 'package:custom_calendar/model/day_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiRequest {
  Future<List<ColorDays>> getColor() async {
    var dio = Dio();

    try {
      final response = await dio.get(endPoint);
      final List result = jsonDecode(response.data);
      var finalResult = result.map(((e) => ColorDays.fromJson(e))).toList();
      return finalResult;
    } catch (e) {
      throw Exception(e);
    }
  }
}

final apiProvider = Provider<ApiRequest>((ref) => ApiRequest());
