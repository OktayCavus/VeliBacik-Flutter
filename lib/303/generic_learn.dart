// ignore_for_file: public_member_api_docs, sort_constructors_first

// bunu kullanacak kişi admin olmalı
//genericleri kullanacağoz sınırlandırma yapmak için generic kullandık
import 'package:equatable/equatable.dart';

class UserManagement<T extends AdminUser>  {

  //final AdminUser admin;
  final T admin;

  UserManagement(this.admin);

  void sayName(genericUser user){
    print(user.name);
  }

  int calculateMoney(List<genericUser> users){

    int initialValue = admin.role == 1 ? admin.money : 0 ;

    //final sumMoney = users.map((e) => e.money).fold<int>(0, (previousValue, element) => element+previousValue);
    // role 1 olan bir admin gelirse adminin parasından başlar ve ekler
    final sumMoney = users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => element+previousValue);
    final _money= users.fold<int>(0, (previousValue, element) => previousValue+element.money);
    return sumMoney;
  }

/// BUNU SADECE ROLE 1 OLANLAR GÖREBİLİR 
/// <VBModel<R>> SANA VBMODEL DÖNECEM TİPİ R
  Iterable<VBModel<R>>? showNames<R>(List<genericUser> users){

      if(R == String){
        final names = users.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
        return names;
      }
    return null;
  }
}
 

class VBModel <T>{
  final String name = 'vb';
  final List <T> items;

  VBModel(this.items);
}

////////////////////



class genericUser  extends Equatable{
  final String name;
  final String id;
  final int money;


  genericUser(this.name, this.id, this.money);

  bool findUserName (String name){
      return this.name == name;
  }


  @override
  String toString() => 'genericUser(name: $name, id: $id, money: $money)';
  
  // EQUATABLE
  @override
  List<Object?> get props => [id];
}


///////////////////

class AdminUser extends genericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
 

}