

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/202/state_manage/state_manage_learn.dart';

abstract class StateLearnViewModel extends State<StateManageLarnView>{
     @override
  void initState() {
    super.initState();
  }
   bool isOpacity = false;

    bool isVisible = false;

    void changeVisible(){
      setState(() {
        isVisible = !isVisible;
      });
    }

    void changeOpacity(){
      setState(() {
        isOpacity = !isOpacity;
      });
    }
    

}