import 'dart:core';
import 'dart:core' as prefix0;

import 'package:flutter/material.dart';

class BaseConverterPage extends StatefulWidget {
  @override
  _BaseConverterPageState createState() => _BaseConverterPageState();
}

class Bases {
  int id;
  String baseName;

  Bases(this.id, this.baseName);

  static List<Bases> getBases() {
    return <Bases>[
      Bases(1, "Binário para Decimal"),
      Bases(2, "Decimal para Binário"),
      Bases(3, "Decimal para Hexadecimal"),
      Bases(4, "Hexadecimal para Decimal"),
    ];
  }
}

class _BaseConverterPageState extends State<BaseConverterPage> {
  String conversionResult = "";
  List<Bases> _bases = Bases.getBases();
  List<DropdownMenuItem<Bases>> _dropDownMenuItems;
  Bases _selectedBase;
  final textFieldController = TextEditingController();

  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems(_bases);
    _selectedBase = _dropDownMenuItems[0].value;
    // TODO: implement initState
    super.initState();
  }

  List<DropdownMenuItem<Bases>> buildDropDownMenuItems(List bases) {
    List<DropdownMenuItem<Bases>> items = List();
    for (Bases base in bases) {
      items.add(
        DropdownMenuItem(
          value: base,
          child: Text(base.baseName),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Bases selectedBase) {
    setState(() {
      _selectedBase = selectedBase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              child: Text(
                "Selecione a forma de conversão",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: Center(
              child: DropdownButton(
                value: _selectedBase,
                items: _dropDownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                hintText: 'Entrada',
                fillColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text("Converter"),
            onPressed: _convertBase,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Resultado: $conversionResult",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _convertBase() {
    print("the button works!");
    print(_selectedBase.baseName);
    print(textFieldController.text);
    if (_selectedBase.id == 1) {
      print(
          "O número decimal ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${binaryToDecimal(textFieldController.text)}");
      setState(() {
        conversionResult = binaryToDecimal(textFieldController.text);
      });
    } else if (_selectedBase.id == 2 || _selectedBase.id == 3) {
      print(
          "O número binário ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${decimaltoBinOrHex(textFieldController.text, _selectedBase.id)}");
      setState(() {
        conversionResult = decimaltoBinOrHex(textFieldController.text, _selectedBase.id);
      });

    } else {
      print(
          "O número binário ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${hexaToDecimal(textFieldController.text)}");
      setState(() {
        conversionResult = hexaToDecimal(textFieldController.text);
      });
    }
  }

  binaryToDecimal(binaryNumber) {
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

  hexaToDecimal(hexNumber) {
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

  decimaltoBinOrHex(decimalNumber, selectedBase) {
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

  String swapNumberToHexCharacter(int number) {
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
