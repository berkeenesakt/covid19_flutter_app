import 'api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('MM/yyyy');
final String formatted = formatter.format(now);
final DateFormat formatterday = DateFormat('dd');
final String formatteday = formatterday.format(now);
final DateFormat formatterhour = DateFormat('kk');
final int formattedhour = int.parse(formatterhour.format(now));
int day = int.parse(formatteday);
int onedayago = day - 1;
Future<Covid> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if (formattedhour < 20) {
      return Covid.fromJson(
          jsonDecode(response.body)['$onedayago/' + '$formatted']);
    } else {
      return Covid.fromJson(
          jsonDecode(response.body)['$formatteday/' + '$formatted']);
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
