class BaseConverter {
  static binaryToDecimal(binaryNumber) {
    // Conversão do número de Int para String
    String num = binaryNumber.toString();
    // Declaração da variável de resultado
    int dec_value = 0;

    // Inicializando a base para 1
    // Aka 2ˆ0
    int base = 1;

    // Loop que incrementa o valor total onde valor da posição do número na String é o expoente.
    for (int i = num.length - 1; i >= 0; i--) {
      if (num[i] == '1') {
        dec_value += base;
      }
      base = base * 2;
    }

    // Retorna o valor total
    return dec_value.toString();
  }

  static hexaToDecimal(hexNumber) {
    String hexNum = hexNumber.toString().toUpperCase();
    int hexLength = hexNum.length;

    int dec_value = 0;

    // Inicializando a base para 1
    // Aka 2ˆ0
    int base = 1;

    for (int i = hexLength - 1; i >= 0; i--) {
      print(hexNum.codeUnitAt(i));
      if (hexNum.codeUnitAt(i) >= '0'.codeUnitAt(0) &&
          hexNum.codeUnitAt(i) <= '9'.codeUnitAt(0)) {
        int asciiValue = hexNum.codeUnitAt(i) - 48;
        dec_value += (asciiValue * base);
      } else if (hexNum.codeUnitAt(i) >= 'A'.codeUnitAt(0) &&
          hexNum.codeUnitAt(i) <= 'F'.codeUnitAt(0)) {
        int asciiValue = hexNum.codeUnitAt(i) - 55;
        dec_value += (asciiValue * base);
      }
      base = base * 16;
    }
    return dec_value.toString();
  }

  static decimaltoBinOrHex(decimalNumber, selectedBase) {
    int base;
    var decNumber = int.parse(decimalNumber);
    print(decimalNumber);
    if (selectedBase == 2) {
      base = 2;
    } else {
      base = 16;
    }

    String convertedNumber = "";
    int resto;
    do {
      resto = decNumber % base;
      decNumber = decNumber ~/ base;
      if (resto > 9) {
        convertedNumber = "${swapNumberToHexCharacter(resto)}$convertedNumber";
      } else {
        convertedNumber = "${resto.toString()}$convertedNumber";
      }
    } while (decNumber != 0);

    return convertedNumber;
  }

  static String swapNumberToHexCharacter(int number) {
    switch (number) {
      case 10:
        return "A";
      case 11:
        return "B";
      case 12:
        return "C";
      case 13:
        return "D";
      case 14:
        return "E";
      case 15:
        return "F";
      default:
        return "";
    }
  }
}
