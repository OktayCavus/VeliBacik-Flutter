
import 'package:flutter/material.dart';


class PasswordTextField extends StatefulWidget {
  //ÜST CLASS
  const PasswordTextField({Key? key,  this.controller}) : super(key: key);
    final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  
  final _obscureTextCharacter = '-';

  bool _isSecure = true;

  void _changeLoading (){
    setState(() {
      _isSecure = !_isSecure;
    });
  }
    // BU KOD ÇALIŞMADI AMA PASSWORD TEXTİNİN SAĞ TARAFUNA
    //GÖZ KOYUYOR VE TEXT'İ GÖSTERİP GİZLİYOR
  @override
  Widget build(BuildContext context) {
    return  TextField(
      //widget üst class'tan okumak için
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      //BU NASIL GÖZÜKECEĞİNİ GÖSTERİYOR PASSWORDUN
      //obscuringCharacter: _obscureTextCharacter,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText:'Password',
        //suffixIcon: Text('data'),
        suffix: _onVisibilityIcon()
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(onPressed: _changeLoading,
    
      icon:  AnimatedCrossFade(firstChild: const Icon(Icons.visibility_outlined), 
      secondChild: const Icon(Icons.visibility_off_outlined), 
      crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
      duration: const Duration(seconds: 2)),);
      
       //icon: Icon(_isSecure ? Icons.visibility_outlined : Icons.visibility_off_outlined));
  }
}