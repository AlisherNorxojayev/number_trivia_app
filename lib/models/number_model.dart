import 'package:flutter/material.dart';

class NumberModel with ChangeNotifier {
  int number;
  String text;

  String status = 'idle';

  void changeStatus(String status) {
    this.status = status;
    notifyListeners();
  }

  void changeModel(NumberModel model){
    number = model.number;
    text = model.text;
    notifyListeners();
  }

  NumberModel({required this.number, required this.text});

  factory NumberModel.fromJson(Map data) {
    return NumberModel(
      number: data['number'],
      text: data['text'],
    );
  }

  Map toJson() {
    return {
      'number': number,
      'text': text,
    };
  }
}
