import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/core/random_image.dart';

import '../core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);

  final double _cardHeight=50;
  final double _cardWidth=250;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: Column(children: [
      Expanded(flex: 4,
      child: Stack(
          alignment: Alignment.center,

        children: [
          //bütün ekranı kaplamasını sağlar positioned.fill 
          Positioned.fill(child: randomImage(),bottom: _cardHeight/2,),
          
          Positioned(height: _cardHeight,
            child: _customCard(),
          width: _cardWidth,bottom: 0,)
        ],
      ),),
      Spacer(flex:6),
     ],), 
     
   ) ;
  }

  Card _customCard() {
    return Card(color: Colors.white,
          shape: RoundedRectangleBorder(),
        
        );
  }
}