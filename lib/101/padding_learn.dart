import 'package:flutter/material.dart';

class paddingLearn extends StatelessWidget {
  const paddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Padding(
        padding: projectPadding().pagePaddingVertical,
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10) ,
              child: Container(
                color: Colors.white,
                height: 100,
                
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20) ,
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              //2 tane paddingi birleştirme 
              padding: projectPadding.pagePaddingOnlyRight + projectPadding().pagePaddingVertical,
              child: Text('ali'),
            )
            
          ],
        ),
      ),
    );
  }
}


class projectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 50);
  static final pagePaddingOnlyRight = const EdgeInsets.only(right: 30);
}