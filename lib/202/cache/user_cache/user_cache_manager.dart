

import 'dart:convert';

import 'package:flutter_application_2/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_2/202/cache/shared_manager.dart';

import '../user_model.dart';

class UserCacheManager{
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {

    final _items = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems(){

    final itemString = sharedManager.getStringItems(SharedKeys.users);
    if(itemString?.isNotEmpty ?? false){
      return itemString!.map((element) {
        final jsonObject = jsonDecode(element);
        if(jsonObject is Map<String , dynamic>){
          return User.fromJson(jsonObject);
        }
        
         return User('name', 'description', 'Url');
      } ).toList();
    }
    return null;
  }
}