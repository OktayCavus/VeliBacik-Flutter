import 'dart:ffi';

import 'package:flutter/material.dart';

class StatelesLearn extends StatelessWidget {
  const StatelesLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          titleText(text: 'Ali'),
          _emptyBox(),
          titleText(text: 'Veli'),
          _emptyBox(),
          titleText(text: 'Meli'), 
          _customContainer(),
          _emptyBox(),
          

        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 20,);
  //bunu ctrl+. ile extract method ile yaptık çünkü birkaç yerde kullanacaz
}


class _customContainer extends StatelessWidget {
  const _customContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Text('data'),
      
      decoration: BoxDecoration(color: Colors.red,borderRadius:BorderRadius.circular(20) ),
    );
  }
}

class titleText extends StatelessWidget{
  const titleText({Key? key,required String this.text}) : super(key: key);
  final String text;
  
  @override
  Widget build(BuildContext context) {
    
    return Text(
            text,
          style: Theme.of(context).textTheme.headline4,
          );
  }
  
}