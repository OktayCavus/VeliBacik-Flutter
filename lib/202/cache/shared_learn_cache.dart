import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/cache/shared_manager.dart';
import 'package:flutter_application_2/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SHARED_PREFERENCES KULLANIMI

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}
// BURDAKİ T TYPE SharedLearn DEN TÜREYECEK
class _SharedLearnState extends LoadingStateful<SharedLearn> {

  late final SharedManager _manager;

  int _currentValue =0;

  late List<User> userItems =[];

  @override
  void initState(){
    super.initState();
    //bunu yapamayız çünkü initState bekleyemez bunu nasıl yaparaız function
/*       final prefs = await SharedPreferences.getInstance();
      final int? counter = prefs.getInt('counter'); */
      _manager = SharedManager();
      userItems = UserItems().users;

      initialize();
  }

  Future<void> initialize () async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

Future<void> getDefaultValues() async {
  //bunları manage içine aldık zaten
/*       final prefs = await SharedPreferences.getInstance();
      final int? counter = prefs.getInt('counter'); */

      //_onChangeValue(counter.toString());
      //getString enum istiyor bunları manage kısmında yazdık
      _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
}



//() içini textfield'in onchange'ine göre yaptık
  void _onChangeValue(String value){
      final _value = int.tryParse(value);

       if(_value!= null){
        setState(() {
          _currentValue = _value;
        });
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(_currentValue.toString()),
        actions: [
        _loading()
       ],
      ),

      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton()
        ],
      ),

      body: Column(
        children: [
          TextField(onChanged: (value) {
            _onChangeValue(value);
            },
          ),
        ],
      ),
      
    );
  }

  SingleChildRenderObjectWidget _loading() {
    return isLoading ? Center(
        child: CircularProgressIndicator()
        ) : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(onPressed: () async {
      changeLoading();
      /* final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('counter', _currentValue); */

      await _manager.saveString(SharedKeys.counter, _currentValue.toString());
      changeLoading();
    },
     child: Icon(Icons.save)
    ,);
  }
    FloatingActionButton _removeValueButton() {
    return FloatingActionButton(onPressed: () async {
      changeLoading();
      /* final prefs = await SharedPreferences.getInstance();
      await prefs.remove('counter'); */

      await _manager.removeItem(SharedKeys.counter);

      changeLoading();
    },
    child: Icon(Icons.remove)
    ,);
  }
}





// DAMI
// bu dataları cache'leyelim
class UserItems {
  late final List<User> users;
  UserItems(){
    users = [
      User('vb', '10', 'vb10.dev'),
      User('vb', '10', 'vb10.dev'),
      User('vb', '10', 'vb10.dev'),

    ];
  }
}



//_changeLoading İ SÜREKLİ YAZMAMAK İÇİN BÖYLE YAPTIK
//GENERİC HALE GETİRDİK
abstract class LoadingStateful<T extends StatefulWidget> extends State<T>{
    bool isLoading= false;

  void changeLoading(){
      setState(() {
        isLoading = !isLoading;
      });
  }
}