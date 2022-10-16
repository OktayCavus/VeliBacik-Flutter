import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/Icon_learn.dart';
import 'package:flutter_application_2/101/image_learn.dart';
import 'package:flutter_application_2/101/stack.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}



class _PageViewLearnState extends State<PageViewLearn> {
  final _PageController=PageController(viewportFraction: 0.7);
  int _currentPageIndex=0;
  void _updatePageIndex(int index){
    setState(() {
      _currentPageIndex=index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
      
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          
          FloatingActionButton(
            onPressed: () {_PageController.previousPage(duration: _durationUtility._durationLow, curve: Curves.easeIn);}
            ,child: Icon(Icons.chevron_left),),
            FloatingActionButton(
            onPressed: () {_PageController.nextPage(duration:_durationUtility._durationLow, curve: Curves.easeInOut);}
            ,child: Icon(Icons.chevron_right),),
        ],
      ),
      appBar: AppBar(),
    // İÇERİSİNE VERİLEN WİDGETLARI YAN YANA (EKRAN OLARAK) DİZMEYİ SAĞLAR
    //EKRANI SAĞA KAYDIR
    //PAGE VİEW'İN KENDİSİ BİR STATE TUTTUĞU İÇİN SETSTATE DEMEDİK
      body: PageView(
        padEnds: false,
        //CONTROLLER PAGECONTROLLER İKİNCİ SAYFANIN ÖN İZLEMESİNİ GÖSTERİYOR
        controller: _PageController,
        //onPageChanged bir fonksiyon alır bizde onu yukarda yazdık
        onPageChanged:_updatePageIndex ,

        children: [
          imageLearn(),
          iconLearnView(),
          StackLearn(),        ],
      ),
    );
  }
}


class _durationUtility{
  static const _durationLow=Duration(seconds: 1);
}