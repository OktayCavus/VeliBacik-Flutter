import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/101/product/language/language_items.dart';

class textFieldLearn extends StatefulWidget {
  const textFieldLearn({Key? key}) : super(key: key);

  @override
  State<textFieldLearn> createState() => _textFieldLearnState();
}

class _textFieldLearnState extends State<textFieldLearn> {

  final key = GlobalKey();
  final focusNodeTextFieldOne = FocusNode();
  final focusNodeTextFieldTwo = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          TextField(
            maxLength:20,
            buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength); 
            },
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email] ,
            inputFormatters: TextProjectInputFormatter()._formatter,
            focusNode: focusNodeTextFieldOne,
            //textInputAction İLE NEXT' E VEYA KLAVYEDEN OK'A BASINCA ALTA GEÇİYOR
            textInputAction: TextInputAction.next,

            decoration:_InputDecorator()._emailInput ,
          ),
          // 2 4 YAPARAK TEXT AREAYA ÇEVİREBİLİRZ
          TextFormField(
            focusNode: focusNodeTextFieldTwo,
          minLines: 2,
          maxLines: 4,),
          
        ],
      ),
      
      
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
          key: key,
          duration: Duration(milliseconds: 1000),
         height: 10,
          width: 10.0*(currentLength ?? 0),
          color: Color.fromARGB(255, 25, 126, 28));
          /* color: Colors.green[100 *((currentLength ?? 0)~/2)]); */
          /* Container(
            height: 10,
            width: 40,
            color: Colors.green[100 *((currentLength ?? 0)~/2)],
            //(currentLength ?? 0) eğer yoksa 0 al demek 
          ); */
  }
}

class _InputDecorator {
  final _emailInput =InputDecoration(
            //PREFİX SOLA EKLEME 
            prefixIcon: Icon(Icons.mail),
            border: const OutlineInputBorder(),
             //HİNTTEXT KUTUNUN İÇİNE
             //hintText: languageItems.mailTitle,
             //LABELTEXT ÜSTE GELİYOR
             //LANGUAGEITEMS PRODUCT KLASÖRÜNÜN İÇİNDE
             //labelText: languageItems.mailTitle,
            );
}


class TextProjectInputFormatter {
   final _formatter = [TextInputFormatter.withFunction((oldValue, newValue) {
          if(newValue.text=='a' || newValue.text=='A'){
            //A/a YA BASTIRMYIOR
            return oldValue;
             }else{
              return newValue;
          }
        })];
}