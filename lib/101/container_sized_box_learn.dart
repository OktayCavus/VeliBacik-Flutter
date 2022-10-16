import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox( //sizedbox bize kutu oluşturmak için
            width: 300,
            height: 200,
            child: Text('a'*500)
          ),
          SizedBox.shrink(),
          SizedBox.square(dimension: 50, //dimesion ile kare yapıyoruz
          child: Text('bbb' *50),

          ),
          Container(
    
            height: 50,
            constraints:  BoxConstraints(
              maxWidth: 100,
              minWidth: 50
            ),
            child: Text('A' * 5),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
            color: Colors.red,
            boxShadow: [BoxShadow(
              color: Colors.green,offset: Offset(0.1,1)
            )],
            shape: BoxShape.circle,
            border: Border.all(
              width: 10,
              color: Colors.white12
            )
            ),
          )
        ],
      )
    );
  }
}
