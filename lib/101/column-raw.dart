

import 'package:flutter/material.dart';


class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          //EXPANDED SAYFAYI %25 ORANINDA BÖLÜYOR
          //FLEX 10'A BÖLÜYOR EKRANI ORAN OLARAK ATIYOR
          Expanded(flex: 4 ,child: Row(
            children: [
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.yellow,)),
              Expanded(child: Container(color: Colors.pink,)),
              Expanded(child: Container(color: Colors.green,)),

              
            ],
          )),
          //SPACER ARAYA BOŞLUK KOYMAYA YARAR
          Spacer(flex: 2,),

          //eğer ki yan yana yazmak ve eşit aralıklarla yazmak istersek row ve onun mainAxisAlignment özelliği
          //kullanılır Responsive tasarım sağlar bize
          Expanded(flex: 2 ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment dikeye göre
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
            Text('data'),
            Text('data2'),
            Text('data3'),


          ],)),
          Container(height: projectCardHeight.height,
          //burdaki expanded bize gönderilen 200'e göre parçalıyoır
          child: Column(children: [
            Expanded(child: Text('data2')),
            Expanded(child: Text('data2')),
            Expanded(child: Text('data2')),
            Expanded(child: Text('data2')),


          ]),)
        ],
      ),
    );
  }
}

class projectCardHeight{
   static double height=200;
}