import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);
  final String _title='Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        //bunların hepsi bütün appBarlarda ortak oolduğu için main içindeki
        //theme'e koyduk copyWith ile koyunca ortak oluyor
        //centerTitle: true,
        //backgroundColor:Colors.transparent, 
       // elevation: 0, //üstteki olunca biraz koyu bunu yazınca arka planla aynı renk
        //systemOverlayStyle:SystemUiOverlayStyle.light , // üstteki yazıların koyuluğu
        leadingWidth:56,//appbarın width'i 
        actionsIconTheme: IconThemeData(color: Colors.red,size: 30),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {},
           icon: Icon(Icons.mark_email_unread_sharp)),
           Center(child: CircularProgressIndicator())
        ],
      ),
      body: Column(children: []),
    );
  }
}