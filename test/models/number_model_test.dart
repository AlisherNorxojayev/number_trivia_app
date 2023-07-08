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
}
