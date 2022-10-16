import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/Icon_learn.dart';
import 'package:flutter_application_2/101/button.dart';
import 'package:flutter_application_2/101/card.dart';
import 'package:flutter_application_2/101/image_learn.dart';

//GENELDE PROJELERDE 1 TANE TAB BAR BULUNUR
//BU YÜZDEN MAİN İÇİNDE THEME KISMINA EKLEYELİM


class tabLearn extends StatefulWidget {
  const tabLearn({Key? key}) : super(key: key);

  @override
  State<tabLearn> createState() => _tabLearnState();
}

class _tabLearnState extends State<tabLearn> with TickerProviderStateMixin {

    late final TabController _tabController;

    final double _notchedValue=7;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: _MyTabViews.values.length, vsync: this);
  } 
 
  @override
  Widget build(BuildContext context) {
    //TAB BAR BİZE SAYFA VERİYOR BURDA 2 TANE VAR SAĞA SOLA KAYDIRABİLİYORUZ
    //TABBAR KULLANIRKEN BUNU KULLANMAK LAZIMDefaultTabController
    return  DefaultTabController(length: _MyTabViews.values.length, child: 
     Scaffold(
      appBar: AppBar(),
    
      // BUTON ŞEKLİ İÇİN İLK 3 PROP VE SHAPE NOTCHMARGİN KULLANILDI
      extendBody: true,
      
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      
      floatingActionButton: FloatingActionButton(onPressed: () {
        //butona bastığımızda home indexine gitmesi için yazdık kodu
        _tabController.animateTo(_MyTabViews.home.index);
      },),
      
      bottomNavigationBar: BottomAppBar(

        //shape: CircularNotchedRectangle(),

        notchMargin:_notchedValue,

        child:_myTab()
      ),

      body: _tabBarView(),
    )
  );
    
  }

  TabBar _myTab() {
    return TabBar(
        labelColor: Colors.blue,

        unselectedLabelColor: Colors.grey,

        indicatorColor: Colors.white,
      // iki yazının da aynı yere gelmesini sağladı
        //isScrollable: true,

       controller: _tabController,

        tabs: /* [

         Tab(text: 'BNB Page 1',),

        Tab(text: 'BNB Page 2',) 
      ] */
      
      //e.name enumdaki isimleri döndürüyor
      _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList()
      
      
      
      );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      
      children: [

    /* Container(color: Colors.red),     
    Container(color: Colors.green,)*/

    imageLearn(),
    iconLearnView(),
    ButtonLearn(),
    cardLearn()

    ] 

    );
  }
}


enum _MyTabViews{
  home,settings,favorite,profile
}
//_MyTabViews enumuna yazıyoruz extension diyerek
extension _MyTabView on _MyTabViews {

}