import 'package:adder_circuit/domain/adder_circuit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AdderCircuit ac;

  group(("Se o circuito somador está adequado para 4 bits"), () {
    setUp(() {
      ac = AdderCircuit(4);
    });

    test("Se 0110 + 0000 = 00110", () {
      List<bool> firstBinaryNumber = [false, true, true, false];
      List<bool> secondBinaryNumber = [false, false, false, false];
      List<bool> result = ac.makeSum(firstBinaryNumber, secondBinaryNumber);

      expect(result[4], isFalse);
      expect(result[3], isFalse);
      expect(result[2], isTrue);
      expect(result[1], isTrue);
      expect(result[0], isFalse);
    });

    test("Se 0111 + 0111 = 01110", () {
      List<bool> firstBinaryNumber = [true, true, true, false];
      List<bool> secondBinaryNumber = [true, true, true, false];
      List<bool> result = ac.makeSum(firstBinaryNumber, secondBinaryNumber);

      expect(result[4], isFalse);
      expect(result[3], isTrue);
      expect(result[2], isTrue);
      expect(result[1], isTrue);
      expect(result[0], isFalse);
    });

    test("Se 1110 + 1000 = 10110", () {
      List<bool> firstBinaryNumber = [false, true, true, true];
      List<bool> secondBinaryNumber = [false, false, false, true];
      List<bool> result = ac.makeSum(firstBinaryNumber, secondBinaryNumber);

      expect(result[4], isTrue);
      expect(result[3], isFalse);
      expect(result[2], isTrue);
      expect(result[1], isTrue);
      expect(result[0], isFalse);
    });
  });

  group(("Se o circuito somador está adequado para 5 bits"), () {
    setUp(() {
      ac = AdderCircuit(5);
    });

    test("Se 11111 + 11110 = 111101", () {
      List<bool> firstBinaryNumber = [true, true, true, true, true];
      List<bool> secondBinaryNumber = [false, true, true, true, true];
      List<bool> result = ac.makeSum(firstBinaryNumber, secondBinaryNumber);

      expect(result[5], isTrue);
      expect(result[4], isTrue);
      expect(result[3], isTrue);
      expect(result[2], isTrue);
      expect(result[1], isFalse);
      expect(result[0], isTrue);
    });

  });

}
