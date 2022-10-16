// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/product/widget/button/answer_button.dart';
import 'package:flutter_application_2/product/widget/button/loading_button.dart';
import 'package:flutter_application_2/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: Column(
          children: [
            // () için onUserSelected içine bakarak yazıyoruz
            // CallbackUser bizden bunu istiyor
              callbackDropdown(onUserSelected: (CallbackUser user){
                print(user);
              }),

              // ANSWER BUTTONU YAZDIK VE
              AnswerButton(
                onNumber:(number){
                  return number % 3 == 1;
                } ,
              ),

              LoadingButton(title: 'Save', onPressed: ()async{
                await Future.delayed(Duration(seconds: 1));
              })
          ],
        ),

    );
  }
}

////////////////////////
// SERVİCE'DEN BİZE DÖNECEK ŞEYLER
// EĞER Kİ EQUALİTY METODUNU EKLEMEZSE LİSTELER AYNI REFERENCE DÖNDÜRDÜKLERİ
//İÇİN KOD CRUSH OLACAK 
class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

// TODO Dummy Remove it
// dummy sonradan silinebilir
  static List<CallbackUser> dummyUsers(){
    return [
      CallbackUser('vb', 123),
      CallbackUser('vb2', 124),
    ];
  }

// BUNU KOYMAZSAK HATA OLARAK ZERO OR 2 OR MORE WERE DETECTED SAME VALUE
//lengt == 1 yazıyor yani 1 olmalı ama bizde fazla veya az var 
  @override
  bool operator ==(covariant CallbackUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

///////////////////////////////
//Dummy (yazımını bilmiyorum) YAPMAK İÇİN
//MÜŞTERİ BUNLARI DAHA BİZE VERMEYECEKSE


