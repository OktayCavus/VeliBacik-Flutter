import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scaffold Samples'),),
      body: Text('Merhaba'),
      extendBody: true,
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder:(context) => Container(
          height: 200
        ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(),
      bottomNavigationBar: Container(
        height: 200,
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label:'aa' ),
        BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label:'bb' )]
        ),
      ),
      
    );
  }
}