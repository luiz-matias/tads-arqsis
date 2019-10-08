import 'package:flutter/material.dart';

class CircuitImagePage extends StatelessWidget {
  final int _imageIndex;

  CircuitImagePage(this._imageIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circuito de soma"),
      ),
      body: Hero(
        tag: 'image_$_imageIndex',
        child: Image.asset(
          "assets/images/adder-circuit-image-$_imageIndex.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
