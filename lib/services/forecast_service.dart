import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ForecastService {
  static Future<int> getPricipitationProbabilityMax(DateTime datetime) async {
    const String lat = '51.5085'; // London
    const String lon = '-0.1257';
    final String date = DateFormat('yyyy-MM-dd').format(datetime).toString();

    final response = await http.get(Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&daily=precipitation_probability_max&timezone=GMT&start_date=$date&end_date=$date"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['daily']['precipitation_probability_max']
          [0];
    } else {
      throw Exception('Failed to load forecast');
    }
  }
}
