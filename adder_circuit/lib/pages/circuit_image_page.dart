import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CircuitImagePage extends StatelessWidget {
  final int _imageIndex;

  CircuitImagePage(this._imageIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagem do circuito"),
      ),
      body: PhotoView(
        backgroundDecoration: BoxDecoration(color: Colors.white),
        heroAttributes: PhotoViewHeroAttributes(
          tag: 'image_$_imageIndex',
        ),
        imageProvider: Image.asset(
          "assets/images/adder-circuit-image-$_imageIndex.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ).image,
      ),
    );
  }
}
