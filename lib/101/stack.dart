import 'package:flutter/material.dart';

// ÜST ÜSTE BİNME VARSA KULLANILIR

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);
  // EN SON KULLANILAN KOD BİR ÖNCEKİNİN ÖNÜNDE OLUR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(color: Colors.red,
        height: 100,),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(color: Colors.white,
          height: 100,),
        ),
      
      
      // STACK COMPONENTLERİ 

      Positioned(
        height: 100,
        width: 50,
        top: 50,
        
        child: Container(color: Colors.green,))

      ],),
    );
  }
}