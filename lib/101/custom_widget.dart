import 'package:flutter/material.dart';

class customWidget extends StatelessWidget {
   customWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = "Food";

    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          Center( //center -> column 
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _customFoodButton(title: title, onPressed: () {  },),
            )
    ),

        ],
      )
    );
  }
}

class _PaddingUtility{
  final EdgeInsets normalPadding = EdgeInsets.all(9.0);

}

class _colorsUtility{
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _customFoodButton extends StatelessWidget with _colorsUtility , _PaddingUtility{
   _customFoodButton({Key? key, required this.title, required this.onPressed}) : super(key: key);
   final String title;
   final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed ,
        style: ElevatedButton.styleFrom(primary: redColor,
        shape: StadiumBorder()),
        child: Center( //center yaparsak bütün sayfaya yayılır üstte column aldık
          child: Padding( //margin'i bunu çağıran verir (padding olarak veriyor )
            padding: normalPadding,
            child: Text(title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: whiteColor,fontWeight: FontWeight.bold)
            //Theme.of(context).textTheme.headline5?.copyWith(color : _colorsUtility().redColor),)),
      ),
          ),
        ),
    );
  }
}