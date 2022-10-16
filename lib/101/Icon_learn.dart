import 'package:flutter/material.dart';

class iconLearnView extends StatelessWidget {
 iconLearnView({Key? key}) : super(key: key);
  final iconSize =iconSizes();
  final iconColor=iconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello')),

      body: Column(
        children: [
          IconButton(onPressed: () {}, 
          icon :Icon(Icons.message_outlined,
          color: Colors.red,
          size: 40,)), 
          SizedBox(height: 10,),
          
          IconButton(onPressed: () {}, 
          icon :Icon(Icons.message_outlined,
          color: iconColor.froly,
          size: iconSize.iconBig,)),
          SizedBox(height: 10,),


          IconButton(onPressed: () {}, 
          icon :Icon(Icons.message_outlined,
          color: iconColor.Heliotrope,
          size: iconSize.iconSmall)),
          SizedBox(height: 10,),


          IconButton(onPressed: () {}, 
          icon :Icon(Icons.message_outlined,
          color: Theme.of(context).backgroundColor,
          size: iconSizes().iconSmall)),
          
          
        ],
      ),
    );
  }
}

class iconSizes{
  final double iconSmall=40;
  final double iconBig=50;
}

class iconColors{
  final Color froly = Color(0XFFEDE961);
  final Color  Heliotrope =Color(0xffE461ED);
}