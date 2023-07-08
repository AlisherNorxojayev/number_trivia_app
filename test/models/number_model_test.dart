import 'package:number_trivia_app/models/number_model.dart';
import 'package:test/test.dart';

void main() {
  group('NumberModel', () {
    test('should create a NumberModel instance with the correct values', () {
      final numberModel = NumberModel(number: 42, text: 'forty-two');
      expect(numberModel.number, equals(42));
      expect(numberModel.text, equals('forty-two'));
    });
  });
  group('NumberModel', () {
    test('should create a NumberModel instance from a JSON map', () {
      final json = {'number': 42, 'text': 'forty-two'};
      final numberModel = NumberModel.fromJson(json);
      expect(numberModel.number, equals(42));
      expect(numberModel.text, equals('forty-two'));
    });

    test('should convert a NumberModel instance to a JSON map', () {
      final numberModel = NumberModel(number: 42, text: 'forty-two');
      final json = numberModel.toJson();
      expect(json['number'], equals(42));
      expect(json['text'], equals('forty-two'));
    });
  });
}
