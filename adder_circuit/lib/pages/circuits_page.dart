import 'package:adder_circuit/pages/circuit_image_page.dart';
import 'package:flutter/material.dart';

class CircuitsPage extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        controller: controller,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              "Circuitos Somadores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Text(
              "Aqui estão todas as imagens para os desenhos de cada soma solicitada.",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            child: GridView.count(
              controller: controller,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(15, (index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey[500]),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Hero(
                      tag: 'image_$index',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CircuitImagePage(index),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/images/adder-circuit-image-$index.png",
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
