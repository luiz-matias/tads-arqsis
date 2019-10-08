import 'package:adder_circuit/domain/logic_operators.dart';

/// Class used to calculate the sum of two binary numbers using logic operators.

class AdderCircuit {
  final int _bitSize;

  AdderCircuit(this._bitSize);

  List<bool> makeSum(List<bool> A, List<bool> B) {
    List<bool> output = List(_bitSize + 1);
    bool carry = false;
    for (int i = 0; i < _bitSize; i++) {
      List<bool> result;
      if (i == 0) {
        result = _halfAdder(A[i], B[i]);
      } else {
        result = _fullAdder(A[i], B[i], carry);
      }

      output[i] = result[0];
      carry = result[1];

      if (i == _bitSize - 1) {
        output[i + 1] = carry;
      }
    }
    return output;
  }

  List<bool> _halfAdder(bool bit1, bool bit2) {
    List<bool> binaryNumber = List(2);
    binaryNumber[0] = LogicOperators.xor(bit1, bit2);
    binaryNumber[1] = LogicOperators.and(bit1, bit2);
    return binaryNumber;
  }

  List<bool> _fullAdder(bool bit1, bool bit2, bool carryIn) {
    List<bool> binaryNumber = List(2);

    bool xorAB = LogicOperators.xor(bit1, bit2);
    bool andAB = LogicOperators.and(bit1, bit2);

    bool sum = LogicOperators.xor(carryIn, xorAB);

    bool andCarryInXorAB = LogicOperators.and(carryIn, xorAB);

    bool carryOut = LogicOperators.or(andAB, andCarryInXorAB);

    binaryNumber[0] = sum;
    binaryNumber[1] = carryOut;
    return binaryNumber;
  }
}
