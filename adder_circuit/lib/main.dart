import 'package:adder_circuit/pages/base_converter.dart';
import 'package:adder_circuit/pages/adder_circuit.dart';
import 'package:adder_circuit/pages/circuits_page.dart';
import 'package:adder_circuit/pages/logic_gates.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.compare_arrows)),
                Tab(icon: Icon(Icons.call_split)),
                Tab(icon: Icon(Icons.add)),
                Tab(icon: Icon(Icons.grid_on)),
              ],
            ),
            title: Text('Circuito somador'),
          ),
          body: TabBarView(
            children: [
              BaseConverterPage(),
              LogicGatesPage(),
              AdderCircuitPage(),
              CircuitsPage()
            ],
          ),
        ),
      ),
    );
  }
}