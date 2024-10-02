import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

void saveListKeyValue(String key, List<String> value) async {
  final prefs = await getSharedPreferences();
  await prefs.setStringList(key, value);
}

List<String> objectToJsonStringList(List<dynamic> list) {
  return list.map((object) => jsonEncode(object.toJson())).toList();
}
