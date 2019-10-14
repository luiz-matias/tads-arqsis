import 'package:adder_circuit/domain/adder_circuit.dart';
import 'package:adder_circuit/domain/base_converter.dart';
import 'package:flutter/material.dart';

class AdderCircuitPage extends StatefulWidget {
  @override
  _AdderCircuitPageState createState() => _AdderCircuitPageState();
}

class _AdderCircuitPageState extends State<AdderCircuitPage> {
  final textFieldController1 = TextEditingController();
  final textFieldController2 = TextEditingController();
  String stringResult = "";
  bool firstConversionMade = false;
  bool secondConversionMade = false;
  bool conversionMade = false;
  bool inputsFilled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "Circuito Somador",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Text(
                "Insira dois números binários para realizar a soma",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  onChanged: (text) {
                    makeSum(
                        textFieldController1.text, textFieldController2.text);
                    setState(() {});
                  },
                  maxLength: 4,
                  controller: textFieldController1,
                  decoration: InputDecoration(
                    labelText: "1° Entrada",
                    hintText: 'ex: 1101',
                    fillColor: Colors.black,
                    helperText: firstConversionMade
                        ? "Em decimal: ${BaseConverter.binaryToDecimal(textFieldController1.text)}"
                        : "Valor binário inválido",
                  ),
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.add,
                size: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  onChanged: (text) {
                    makeSum(
                        textFieldController1.text, textFieldController2.text);
                    setState(() {});
                  },
                  maxLength: 4,
                  controller: textFieldController2,
                  decoration: InputDecoration(
                    labelText: "2° Entrada",
                    hintText: 'ex: 1111',
                    fillColor: Colors.black,
                    helperText: secondConversionMade
                        ? "Em decimal: ${BaseConverter.binaryToDecimal(textFieldController2.text)}"
                        : "Valor binário inválido",
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "=",
                style: TextStyle(fontSize: 48),
              ),
            ),
            inputsFilled
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Center(
                      child: Text(
                        "$stringResult",
                        style: TextStyle(
                          fontSize: 48,
                        ),
                      ),
                    ),
                  )
                : Container(),
            conversionMade && inputsFilled
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Center(
                      child: Text(
                        "Em decimal: ${BaseConverter.binaryToDecimal(stringResult)}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  )
                : Container(),
            !inputsFilled
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Center(
                      child: Text(
                        "Preencha todos os 4 bits de cada entrada para ver o resultado",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void makeSum(String number1, String number2) {

    List<bool> firstBinaryNumber = [false, false, false, false];
    List<bool> secondBinaryNumber = [false, false, false, false];
    List<bool> result = new List(5);

    conversionMade = true;
    firstConversionMade = true;
    secondConversionMade = true;

    int j = 3;
    for (int i = 0; i < number1.length; i++) {
      if (number1[i] == "1") {
        firstBinaryNumber[j] = true;
      } else if (number1[i] == "0") {
        firstBinaryNumber[j] = false;
      } else {
        firstConversionMade = false;
      }
      j--;
    }

    j = 3;
    for (int i = 0; i < number2.length; i++) {
      if (number2[i] == "1") {
        secondBinaryNumber[j] = true;
      } else if (number2[i] == "0") {
        secondBinaryNumber[j] = false;
      } else {
        secondConversionMade = false;
      }
      j--;
    }

    conversionMade = firstConversionMade && secondConversionMade;

    if (number1.length == 4 && number2.length == 4) {
      inputsFilled = true;
      if (conversionMade) {
        AdderCircuit adderCircuit = new AdderCircuit(4);
        result = adderCircuit.makeSum(firstBinaryNumber, secondBinaryNumber);

        stringResult = "";
        for (int i = result.length - 1; i >= 0; i--) {
          stringResult += result[i] ? "1" : "0";
        }
        print("3: $stringResult");
      } else {
        stringResult = "Inválido";
      }
    } else {
      inputsFilled = false;
    }
  }
}
