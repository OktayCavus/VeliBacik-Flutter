import 'package:flutter/material.dart';

class imageLearn extends StatelessWidget {
final String imagePath = "https://www.freepnglogos.com/uploads/ay-yildiz-png/ay-yildiz-national-emblem-turkey-png-2.png";

  const imageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: pngImage(name: ImageItems().bookWithoutPath)
            ), 
            //burda bu yazı okuma saçma üste alalım
            Image.network(imagePath,
            //error builder icon path'i yanlış verilirse diye koyduk
            //errorBuilder: (context, error, stackTrace) => Icon(Icons.abc_outlined),)
            errorBuilder: (context, error, stackTrace) => pngImage(name : ImageItems().bookWithoutPath))
        ]
      ),
    );
  }
}

class ImageItems{
  final String book ="assets/book.png";
  final String bookWithoutPath = "indir";
  final String demosImage = "dice";
  final String demosBookImage = "booked";
}

class pngImage extends StatelessWidget{
  final String name;

  const pngImage({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    
    return Image.asset(
              _nameWithPath,
            fit: BoxFit.cover);
  }

  String get _nameWithPath => "assets/png/$name.png";

}