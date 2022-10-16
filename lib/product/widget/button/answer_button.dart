import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key,  this.onNumber}) : super(key: key);
  
  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _answerButtonState();
}

class _answerButtonState extends State<AnswerButton> {

  Color? _backgroundColor ;

  //bana bir sayı dön random olarak ben bu sayıyı kontrol edip 
  //sana bir cevap vericem bu cevaba göre buttonun rengini güncelle

  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: Text('data'),
    style: ElevatedButton.styleFrom(primary: _backgroundColor),
    onPressed: (){
      final result = Random().nextInt(10);
     // print(result);
      final response = widget.onNumber?.call(result) ?? false;
      setState(() {
        _backgroundColor = response ? Colors.green : Colors.red;
      });
    },
     );
  }
}