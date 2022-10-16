import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/state_manage/state_learn_view_model.dart';

class StateManageLarnView extends StatefulWidget {
  const StateManageLarnView({Key? key}) : super(key: key);

  @override
  State<StateManageLarnView> createState() => _StateManageLarnViewState();
}

// DİKKAT BURAYA EXTENDS OLARAK VİEWMODEL VERİYORUZ
class _StateManageLarnViewState extends StateLearnViewModel{
/*      @override
  void initState() {
    super.initState();
  }

   bool _isOpacity = false;

    bool _isVisible = false;

    void _changeVisible(){
      setState(() {
        _isVisible = !_isVisible;
      });
    }

    void _changeOpacity(){
      setState(() {
        _isOpacity = !_isOpacity;
      });
    } */
  // ÜSTTEKİ KISMI VİEWMODEL'E GEÇİRECEĞİZ KOD KARMAŞASINI ENGELLEMEK İÇİN
  //EXTENDS KISMI ALINIP VİEWMODEL'E VERİLİR
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeOpacity();
      },),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green ,
        shadowColor: isVisible ? Colors.black : Colors.grey,
      ),
    );
  }
}