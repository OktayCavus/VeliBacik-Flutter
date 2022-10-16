import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/image_learn.dart';

import 'navigate_detail.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>  with navigationManager{
  List<int> selectedItemsArray=[];

  void addSelected(int index ,bool isAdd){
    
    setState(() {
      isAdd ? selectedItemsArray.add(index) : selectedItemsArray.remove(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(itemBuilder: (context,index){
        return TextButton(
          // ITEMBUİLDER İÇİNDE OLDUĞUMUZ İÇİN HANGİ İTEMİN TIKLANDIĞINI 
          //ÖĞRENEBİLİRİZ O YÜZDEN BU KOD BURAYA YAZILDI
          //BİZ PLACEHOLDER'A TIKLANDIĞINI ÖĞRENMEK İSTEDİĞMİİZ İÇİN KODU BURAYA YAZDIK
          //FLOATİNGACTİONBUTTON İÇİNİ BOŞALTTIK
          onPressed: ()async {
            final response =await navigateToWidgetNormal<bool>(context, 
            NavigateDetailLearn(isOkay:selectedItemsArray.contains(index) ,));
            if(response is bool){
              //RESPONSE VERİYORUZ EKLİ OLUP OLMADIĞINI ANLAMAK İÇİN
              addSelected(index,response);
            }

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(color: selectedItemsArray.contains(index) ? Colors.grey : Colors.red,),
          ),
        );
      }),
///AWAİT DEYİNCE ASYNC EKLİYORUZ
      floatingActionButton: FloatingActionButton(onPressed: () async{

        
        //SAYFADAN GERİ GELDİĞİMZDE RESPONSE GİRER
        //GİDERKEN GİRMEZ

        
        
        // BURAYI DIŞARI ALALIM
        /* Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return imageLearn();
        },
        fullscreenDialog: true,
        settings: RouteSettings()

        )); */
      },
       child: Icon(Icons.navigation_rounded,),
    )
    );

  }
}

// MİXİN CONSTRUCTORSIZ CLASS 
//BU CLASSI ÜSTE WİTH İLE KAZANDIRDIK
mixin navigationManager{
   void navigateToWidget(BuildContext context, Widget widget){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context){
          return widget;
        },
        fullscreenDialog: true,
        settings: RouteSettings()

        ));
  } 

    Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget){
      return Navigator.of(context).push<T>(
        MaterialPageRoute(
          builder: (context){
          return widget;
        },
        settings: RouteSettings()

        ));
  }

}