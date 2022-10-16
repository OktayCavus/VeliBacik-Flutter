import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/demos/color_demos_view.dart';

import 'color_demos_view.dart';


// ÜSTTEKİ BUTONA BASINCA PEMBEYE DÖNECEK AMA ŞÖYLE BİR SORUN VAR
//ALT TARAF FARKLI ÜST TARAF FARKLI YÖNETİLİYOR
//BU YÜZDEN MÜŞTERİDEN PARAMETRE OLARAK ALIYORUZ
class colorLifeCycleView extends StatefulWidget {
  const colorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<colorLifeCycleView> createState() => _colorLifeCycleViewState();
}

class _colorLifeCycleViewState extends State<colorLifeCycleView> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton
        (onPressed: () {
          setState(() {
            _backgroundColor = Colors.pink;
          });
          
        }, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(child: ColorDemos(initialColor: _backgroundColor))
        ],
      ),
    );
  }
}