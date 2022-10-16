import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key, required this.title, required this.onPressed}) : super(key: key);
  final String title;
  // ADAMIN TIKLAMASINI ADAMA VERMEK İÇİN 
  // future yapma sebebimiz widget.onPressed.call(); 
  //bu işlemi beklemesi
  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {

  bool _isLoading = false;
  void _changeLoading(){
    setState(() {
      _isLoading = ! _isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton (
        child:Center(child: _isLoading ? CircularProgressIndicator() : Text(widget.title)) ,
        onPressed: ()  async {
          
          if (_isLoading) return;
          _changeLoading();
          await widget.onPressed.call();
          _changeLoading();
        }, 
      
      ),
    );
  }
}