import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/product/counter_hello_button.dart';
import 'package:flutter_application_2/101/product/language/language_items.dart';

import '../product/counter_hello_button.dart';


class StatefulLearn extends StatefulWidget {
  const StatefulLearn({Key? key}) : super(key: key);

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
     int _countValue=0;

  // setState ekranı güncelliyor
  // SETSTATE İÇİNDE KOD YAZILINCA BUİLD METHODU TEKRAR TETİKLENİR

     void updateCounter (bool isIncrement){
        if(isIncrement){
          _countValue=_countValue+1;}
        else
          _countValue=_countValue-1;

          setState(() {});

     }

  @override
  Widget build(BuildContext context) {
    var languageItems;
    return Scaffold(
      appBar: AppBar(
        //BUNLARI TEMİZ KOD İÇİN LANGUAGE DOSAYASI OLUŞTURUZ
        //VE ONLARIN ALTINDA TUTARIZ
        title: Text(languageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _increaseButton(),
          
          _decreaseButton(),
          
        ],
        
      ),
      body: Column(
        children: [
          Center(child: Text(_countValue.toString(),
          style: Theme.of(context).textTheme.headline2,)),
          Placeholder(),
          //product'ın içine koyduk çünkü bu prokeye özgü ve buna bastığımzda
          //diğer buttonlarında çalışmasını istemiyoruz bu yüzden ayrı bir yerde yazdık
          //eğer ki burda kodu yazsaydık print çalışırdı sürekli
          CounterHelloButton()
        ],
      ),
    );
  }

  FloatingActionButton _increaseButton() {
    print('burda');
    return FloatingActionButton(onPressed: () {
      updateCounter(true);
    },
        child: Icon(Icons.add),
        
        );
  }

  Padding _decreaseButton() {
    return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FloatingActionButton(onPressed: () {
            updateCounter(false);

          },
          child: Icon(Icons.remove),
          
          ),
        );
  }
}