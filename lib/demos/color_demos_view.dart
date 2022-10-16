// BİR EKRAN OLACAK
// 3 BUTTON OLACAK VE BUNLARA BASINCA RENK DEĞİŞİMİ OLACAK
// SECİLİ OLAN BUTON SELECTED İCON OLSUN
import 'dart:developer';

import 'package:flutter/material.dart';


class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor ;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    // INSPECT DEBUG YAPMAYA YARIYOR
    inspect(widget);

    if(widget.initialColor != _backgroundColor && widget.initialColor!=null){
      changeBackgroundColor(widget.initialColor!);
    }
  }

  
  void changeBackgroundColor(Color color){
      setState(() {
        _backgroundColor = color;

      });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: _backgroundColor,
    appBar: AppBar(),

    bottomNavigationBar: BottomNavigationBar(
      //ONTAP İTEMLERDAN HANGİSİNE BASILDIĞINI BİZE GÖSTERİR
      onTap: _colorOnTap,
      
      items:[
      BottomNavigationBarItem(icon: _BottomNavigationBarContainer(colors: Colors.red,),label: 'Red'),
      BottomNavigationBarItem(icon: _BottomNavigationBarContainer(colors: Colors.yellow,),label: 'Yellow'),
      BottomNavigationBarItem(icon: _BottomNavigationBarContainer(colors: Colors.blue,),label: 'Blue'),
      
      
      ] ),
   ); 
  }

  void _colorOnTap(int value) {
       if(value ==_MyColors.red.index){
         changeBackgroundColor(Colors.red);
       }else if(value ==_MyColors.yellow.index){
         changeBackgroundColor(Colors.yellow);
     }else if (value ==_MyColors.blue.index){
         changeBackgroundColor(Colors.blue);
     }
     }
}

enum _MyColors{
  red,
  yellow,
  blue
}

class _BottomNavigationBarContainer extends StatelessWidget {
  const _BottomNavigationBarContainer({
    Key? key,required this.colors
  }) : super(key: key);

  final Color colors ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors,width: 10,height: 10,);
  }
}

