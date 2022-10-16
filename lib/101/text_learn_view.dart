import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget{
  const TextLearnView({Key? key, this.userName}) : super(key: key);
  final String name = 'Veli';

  final String? userName;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('Welcome $name ${name.length}'),
              textAlign: TextAlign.center,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: TextStyle(
              decoration: TextDecoration.underline,
              wordSpacing: 2,
              letterSpacing: 2,
              color: Colors.orange[900],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ) ,
       
            ),
            Text(
              ('Welcome $name ${name.length}'),
              textAlign: TextAlign.center,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: ProejectStyles.welcomeStyle
            ),
            Text(
              ('Welcome $name ${name.length}'),
              textAlign: TextAlign.center,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.yellow
              ),
            ) ,

            Text(userName ?? '')
          ],
        ),),
    );
  }
}

class ProejectStyles{
  static TextStyle welcomeStyle=TextStyle(
              decoration: TextDecoration.underline,
              wordSpacing: 2,
              letterSpacing: 2,
              color: Colors.orange[900],
              fontSize: 16,
              fontWeight: FontWeight.w600,);
}
