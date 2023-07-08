import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:number_trivia_app/models/number_model.dart';

Future<NumberModel> getRandomNumber() async {
  Uri url = Uri.parse('http://numbersapi.com/random/');

  http.Response response = await http.get(url, headers: {
    'Content-Type': 'application/json',
  });

  Map data = jsonDecode(response.body);

  return NumberModel.fromJson(data);
}

Future<NumberModel> getNumber(int number) async {
  Uri url = Uri.parse('http://numbersapi.com/$number/');

  http.Response response = await http.get(url, headers: {
    'Content-Type': 'application/json',
  });

  Map data = jsonDecode(response.body);

  return NumberModel.fromJson(data);
}
