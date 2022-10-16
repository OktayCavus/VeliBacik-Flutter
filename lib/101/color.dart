import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
   ColorLearn({Key? key}) : super(key: key);

  final colorItem=colorsItems();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),


      body: Container(
        //1. YÖNTEM CONTAİNER İLE SARIP CONTAİNER'IN COLOR ÖZELLİĞİNİ KULLANMAK
        //color: Colors.red,
        //color: colorItem.Sandal, //2. yöntem
        color: Theme.of(context).errorColor, //3.yöntem maindeki theme'e ekle burda ordan çağır
        child: Text('MERHABA')),
    );
  }
}

class colorsItems{
  final Color coralTree = Color(0xffAB6A69); 

  final Color Sandal = Color.fromRGBO(171, 153, 105, 1);
}