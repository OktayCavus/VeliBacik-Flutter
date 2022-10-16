import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/101/image_learn.dart';

class demosApp extends StatelessWidget {
  const demosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final _title = "Create your first note";
    final _textDescription = "Add a note";
    final _createNote = "Create a note";
    final _importNote ="Import Notes";
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,),

      body: Padding(
        padding: pagePaddingItems.horizontalPadding,
        child: Column(
          children: [
            pngImage(name: ImageItems().demosBookImage),
            _TitleWidget(title: _title),
            Padding(
              padding: pagePaddingItems.verticalPadding,
              child: _subtitleWidget(text: _textDescription *10),
            ),
            Spacer(),

            _createElevatedButton(_createNote, context),

            TextButton(onPressed: () {}, 
            child: Text(_importNote)),
            //burda buttonheight kullanma nedenimiz değerinden dolayı isme takımla
            SizedBox(height: buttonHeight.normalButtonHeight,)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createElevatedButton(String _createNote, BuildContext context) {
    return ElevatedButton(onPressed: () {}, 
            child: SizedBox(
            height: buttonHeight.normalButtonHeight,
            child: Center(child: Text(_createNote,style: Theme.of(context).textTheme.headline5,))));
  }
}
// Centered text widget
class _subtitleWidget extends StatelessWidget {
  const _subtitleWidget({
    this.textAlign = TextAlign.center,
    required this.text,
    Key? key,
  }) : super(key: key);
  
  final TextAlign textAlign;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black,fontWeight: FontWeight.w400),
    textAlign: textAlign);
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black,fontWeight: FontWeight.w800),
    );
  }
}


class pagePaddingItems{
  static final EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class buttonHeight {
  static const double normalButtonHeight =50;
}