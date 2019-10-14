import 'package:adder_circuit/domain/logic_operators.dart';
import 'package:flutter/material.dart';

class LogicGatesPage extends StatefulWidget {
  @override
  _LogicGatesPageState createState() => _LogicGatesPageState();
}

class _LogicGatesPageState extends State<LogicGatesPage> {
  bool bit1 = false;
  bool bit2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Portas lógicas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Entradas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: bit1,
                  onChanged: (value) {
                    setState(() {
                      bit1 = value;
                    });
                  },
                ),
                SizedBox(
                  width: 64,
                ),
                Switch(
                  value: bit2,
                  onChanged: (value) {
                    setState(() {
                      bit2 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Saídas",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$bit1 AND $bit2 = ${LogicOperators.and(bit1, bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$bit1 OR $bit2 = ${LogicOperators.or(bit1, bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$bit1 XOR $bit2 = ${LogicOperators.xor(bit1, bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "NOT $bit1 (bit1) = ${LogicOperators.not(bit1)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "NOT $bit2 (bit2) = ${LogicOperators.not(bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$bit1 NAND $bit2 = ${LogicOperators.nand(bit1, bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$bit1 NOR $bit2 = ${LogicOperators.nor(bit1, bit2)}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
