import 'dart:convert';

import 'package:http/http.dart' as http;

Future<int> getNumber() async {
  await Future.delayed(const Duration(seconds: 3));
  return 42;
}

Future<String> getRandomChuckJoke() async {
  // HTTP Anfrage an die API (dauer ca. 1 Sekunde)
  final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
  // JSON String in Variable speichern
  String jsonString = response.body;
  // JSON String in Map umwandel
  Map<String, dynamic> m = jsonDecode(jsonString);
  // 3. Wert (also den Witz) aus der Map extrahieren
  return m['value'];
}
