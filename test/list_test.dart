

import 'package:collection/collection.dart';
import 'package:flutter_application_2/303/generic_learn.dart';
import 'package:flutter_application_2/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setUp((){});

  test('best of List', (){
      List<genericUser> users =[ 
        genericUser('vb', '11', 10),
        genericUser('vb', '11', 10),
        genericUser('vb', '11', 10)
      ];

// ELİMİZDE USER VAR AMA BU HighCard İSTİYOR mapleriz
//maplemenin amacı elimizdeki modelden yeni bir model oluşturmak
      List<HighCard> highCards = users.map((e) {
        return HighCard(items: e.name.split('').toList());
      }).toList();

      // usersların içinde sadece vb yazanları almak istiyoruz
      //singlewhere kullanırız

      try {
        //try catch yapmazsak too many arguement hatası alırız
        // orElse ile engelleriz
        users.singleWhere((element) => element.findUserName('vb'),
        orElse: () {
          return genericUser('name', 'id', 0); // default oldu
        },);
      } catch (e) {
        print(e);
      }

      print(users.where((element) => element.money >5));

      users.lastWhere((element) => element.id=='5');

  // REFERENCE TİP OLDUĞU İÇİN LİST BÖYLE SİLME YAPAMAYIZ
 // EQUATABLE Yİ EXTENDS ETMEMİZ LAZIM
      users.remove(genericUser('vb', '11', 10));

// bulmaya yarayanlar
      users.indexOf(genericUser('vb', '11', 10));
      users.indexWhere((element) => element.id=='10');

  });

    test('best of List with collection', (){
      List<genericUser> users =[ 
        genericUser('vb', '11', 10),
        genericUser('vb', '11', 10),
        genericUser('vb', '11', 10)
      ];

      final response  = users.singleWhereOrNull((element) => element.findUserName('a'),);

      users.lastWhereOrNull((element) => element.id=='5');

      print(response);
  });
}