import 'package:flutter/material.dart';


class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {

  GlobalKey <FormState> _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Form(
        //_key ile formstate'in bütün durumlarına erişebiliriz
        key: _key,
        onChanged: () {},
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                //BU KULLANIM ÇOK ÖNEMLİ VALUE BOŞ GELİRSE FALSE DÖNER
                //VALUE GELİRSE DURUMA GÖRE NULL VEYA YAZIMIZ DÖNECEK
                // ?? demek null ise sağdaki değilse soldaki değeri ata demek
               //yani null ise false ve bizim ifademiz döner 
               //değilse value?.isNotEmpty sonucuna göre döner
                return (value?.isNotEmpty ?? false) ? null :validatorMessage._notEmpty;
              },
            ),

            TextFormField(
              //burdaki validator ile üstteki aynı 
              validator: formFieldValidater().isNotEmpty,
            ),


            DropdownButtonFormField<String>(
              validator: formFieldValidater().isNotEmpty,
              items: const [
              DropdownMenuItem(child:Text('a'), value: 'v',),
              DropdownMenuItem(child:Text('a'), value: 'v2'),
              DropdownMenuItem(child:Text('a'), value: 'v3')
            ], onChanged: (value) {
              
            },),
      
            ElevatedButton(onPressed: () {
              if(_key.currentState?.validate() ?? false){
                  print('object');
              }
            }, child: Text('SAVE'))
          ],
        ),
      ),
    );
  }
}



class formFieldValidater{
  //bu methodu validator'un aynısı yazıyoruz
  //validatorun üzerine git bak 
  String? isNotEmpty(String? data){
    return (data?.isNotEmpty ?? false) ? null : validatorMessage._notEmpty;
  }
}

class validatorMessage{
  static const _notEmpty = 'bos gecilemez';
}