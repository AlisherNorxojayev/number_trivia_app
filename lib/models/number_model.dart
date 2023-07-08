class NumberModel {
  final int number;
  final String text;

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
