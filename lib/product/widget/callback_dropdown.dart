import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

// IMMUTABLE STATE KISMI BURASI FİNAL YAPMAK ZORUNDAYIZ
class callbackDropdown extends StatefulWidget {
  const callbackDropdown({Key? key, required this.onUserSelected}) : super(key: key);
 // UPDATEUSER OLDUĞUNDA EKRANA HABER VERMEK İÇİN CALLBACK DEVREYE GİRİYOR
// burda sadece nullable olmayan durumları haber vereceğiz
//callback için function olmalı
 final void Function(CallbackUser user) onUserSelected;


  @override
  State<callbackDropdown> createState() => _callbackDropdownState();
}


/////////////////////////////////



class _callbackDropdownState extends State<callbackDropdown> {

  CallbackUser? _user;

  // ANA EKRANIN BU CLASSTAN HABERİ OLMASI İÇİN FUNC YAZALIM

  void updateUser(CallbackUser? item){
    setState(() {
      _user = item;
    });
    if(_user != null){
      // İF STATE'İNDEN GEÇTİYSE NULL DEĞİLDİR BU YÜZDEN ! VERDİK
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // DropdownButton bir generic bekler üzerine gelince görürsn
    return DropdownButton<CallbackUser>(
              //value göstermek için veriliyor
              //altta setState yaparak sürekli güncelliyoruz
              value: _user,
              
              items:CallbackUser.dummyUsers().map((e){
              // items DropdownMenuItem DÖNDÜRÜR
              return DropdownMenuItem(child: Text(e.name),value: e,);
              }).toList() 
            
            
            // ONCHANGED SEÇİLİ OLANI VERİR
            //üzerine gel bak CallbackUser?
            // ÜSTTEKİ METODU YAZDIKTAN SONRA updateUser BÖYLE YAPSAK OLIR
            , onChanged: updateUser
            
            /* (CallbackUser? callbackUser){
              ON CHANGED BASTIĞINDA YOLLAYACAK O YÜZDEN bize callbackUser 
              yollasın ki ona göre sayfayı güncelleyebilelim dedik
              setState(() {
                _user = callbackUser;
              });
            } */
            );
  }
}