import 'package:flutter/material.dart';

class cardLearn extends StatelessWidget {
  const cardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(),
      body:Column(
        children: [
          //CARD COMPONENTİ ELEVATİONLU GELİR Z İNDEXİ GİBİ ÖNDE TUTUYOR
          Card(
            margin: projectMargin.cardMargin,
            shape: StadiumBorder(),
            //color: Colors.white,
            color: Theme.of(context).colorScheme.error,
            child: SizedBox(height: 100,width: 200,),),
          Card(
            shape: CircleBorder(),
            color: Colors.white,
            child: SizedBox(height: 100,width: 100,),),
          
          //_customCard(child: SizedBox(height: 100,width: 100,)),
          _customCard(child: SizedBox(height: 100,width: 200,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
        ],
      )
    );
  }
}

class projectMargin{
  static const cardMargin=EdgeInsets.all(10);
}

class _customCard extends StatelessWidget{
  final Widget child;
  final ShapeBorder shape ;

  const _customCard({super.key, required this.child, required this.shape});
  @override
  Widget build(BuildContext context) {
    return  Card(
            color: Theme.of(context).backgroundColor.withGreen(230),
            // shape'i üste alıp parametre olarakta alabiliriz veya 
            // shape'i main içindeki cardTheme özelliği ile ayarlayabiliriz
            //main içinde yazarsak bütün kartlar aynı şekle girer
           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: child
            );
  }

}

//borders
//StadiumBorder()
//CircleBorder()
//RoundedRectangleBorder