import 'package:flutter_application_2/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys{
  counter,users
}

class SharedManager{
  SharedPreferences? preferences;
//BU CONSTRUCTORU Yazmak yerine initialize kdounu PROJENİN içinde yazalım
  
  SharedManager();
    //{init();}
  
// 17. kodu sürekli yazmak yerine burda init yapalım içinde yazalım
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences(){
    if(preferences==null){
      throw sharedNotInitializedExcepiton();
    }
  }
  
  Future<void> saveString(SharedKeys key, String value) async{
    //final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

   Future<void> saveStringItems(SharedKeys key, List<String> value) async{
    //final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(SharedKeys key) {
    //final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
     return preferences?.getStringList(key.name);
  }


  String? getString(SharedKeys key) {
    //final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    return preferences?.getString(key.name);
  }


  Future<bool> removeItem(SharedKeys key) async{
    //final prefs = await SharedPreferences.getInstance();
     _checkPreferences();
     return (await preferences?.remove(key.name)) ?? false;
  }

}