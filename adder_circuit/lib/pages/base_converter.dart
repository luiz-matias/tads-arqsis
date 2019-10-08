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
      Bases(1, "Hexadecimal"),
      Bases(2, "Decimal"),
      Bases(3, "Octal"),
      Bases(4, "Binário"),
    ];
  }
}

class _BaseConverterPageState extends State<BaseConverterPage> {
  List<Bases> _bases = Bases.getBases();
  List<DropdownMenuItem<Bases>> _dropDownMenuItems;
  Bases _selectedBase;
  Bases _secondSelectedBase;
  final textFieldController = TextEditingController();

  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems(_bases);
    _selectedBase = _dropDownMenuItems[0].value;
    _secondSelectedBase = _dropDownMenuItems[0].value;
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

  secondChangeDropdownItem(Bases secondBase) {
    setState(() {
      _secondSelectedBase = secondBase;
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
          Container(
            child: Text(
              "Selecione a base do número de entrada",
              style: TextStyle(fontSize: 18),
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
            width: MediaQuery.of(context).size.width / 3.5,
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                hintText: 'Entrada',
                fillColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: Text(
              "Selecione a base do número de saída",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: Center(
              child: DropdownButton(
                value: _secondSelectedBase,
                items: _dropDownMenuItems,
                onChanged: secondChangeDropdownItem,
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
        ],
      ),
    );
  }

  _convertBase() {
    print("the button works!");
    print(_selectedBase.baseName);
    print(_secondSelectedBase.baseName);
    print(textFieldController.text);
    print(
        "O número decimal ${textFieldController.text} na base ${_secondSelectedBase.baseName} é igual a ${binaryToDecimal(textFieldController.text, _secondSelectedBase.baseName)}");
  }

  binaryToDecimal(binaryNumber, base) {
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
    return dec_value;
  }
}
