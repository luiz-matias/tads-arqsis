import 'dart:core';
import 'dart:core' as prefix0;

import 'package:adder_circuit/domain/base_converter.dart';
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
          "O número decimal ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${BaseConverter.binaryToDecimal(textFieldController.text)}");
      setState(() {
        conversionResult =
            BaseConverter.binaryToDecimal(textFieldController.text);
      });
    } else if (_selectedBase.id == 2 || _selectedBase.id == 3) {
      print(
          "O número binário ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${BaseConverter.decimaltoBinOrHex(textFieldController.text, _selectedBase.id)}");
      setState(() {
        conversionResult = BaseConverter.decimaltoBinOrHex(
            textFieldController.text, _selectedBase.id);
      });
    } else {
      print(
          "O número binário ${textFieldController.text} na base ${_selectedBase.baseName} é igual a ${BaseConverter.hexaToDecimal(textFieldController.text)}");
      setState(() {
        conversionResult =
            BaseConverter.hexaToDecimal(textFieldController.text);
      });
    }
  }
}
