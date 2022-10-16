import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SharedContextLearn extends StatefulWidget {
   SharedContextLearn({Key? key}) : super(key: key);

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

enum _SecureKeys{
  token
}


class _SharedContextLearnState extends State<SharedContextLearn> {

 final _storage =  FlutterSecureStorage();

  String _title = '';

  void saveItems(String data){
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();

  } 

  void getSecureItems() async{
    _title = await _storage.read(key: _SecureKeys.token.name) ?? "";
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),

      floatingActionButton: FloatingActionButton.extended(onPressed: () async {
         await _storage.write(key: _SecureKeys.token.name, value: _title);
      }, label:Text('Save')),

      body: TextField(
          onChanged: saveItems,
      ),
    );
  }
}