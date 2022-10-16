import 'package:flutter/material.dart';


class _WidgetSizeEnumLearnView extends StatefulWidget {
  const _WidgetSizeEnumLearnView({Key? key}) : super(key: key);

  @override
  State<_WidgetSizeEnumLearnView> createState() => __WidgetSizeEnumLearnViewState();
}

class __WidgetSizeEnumLearnViewState extends State<_WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:WidgetSizes.normalCardHeight.value() ,
    );
  }
}


enum WidgetSizes{normalCardHeight, circleProfileWidth}

 extension WidgetSizeExtension on WidgetSizes {
//THİS DİYEREK ENUM'A ERİŞEBİLİRİZ
    double value(){
      switch (this) {
        
        case WidgetSizes.normalCardHeight:
          return 25;
        case WidgetSizes.circleProfileWidth:
          return 30;

      }
    }
 }