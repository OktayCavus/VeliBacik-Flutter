import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      floatingActionButton: FloatingActionButton(onPressed: () async {
          
        final response =await showDialog(
          //çıkan alert dışında bir yere basamıyor
         // barrierDismissible: false,
          context: context,
          builder: (context){
          //return UpdateDialog(context:context);

          return _ImageZoomDialog();
          
        }
        );
        //inspect(response);
      },),
    );
  }
}

///////////////////////////

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Version'),
      actions: [

        ElevatedButton(
          onPressed: (){
            //BASILINCA TRUE DÖNECEK VE SHOW DİALOG'A GİDELİM
            Navigator.pop(context,true);
          }, child: Text('Update')
        ),

        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Close')
        )

      ],
    );
  }
}

////////////////////////////

class Keys{
  static const versionUpdate = 'Version Update';
  static const update = 'Update';
}


///////////////////////////////////
//_UpdateDialogun kopyasını yaptık diğer taraflarda kullanırken bunun 
//üzerinden çağırıp kullanabiliriz artık 
class UpdateDialog extends AlertDialog{
   UpdateDialog({Key? key,required BuildContext context}) : super(key: key,
  title: Text(Keys.versionUpdate),
      actions: [
        
        ElevatedButton(
          onPressed: (){
            //BASILINCA TRUE DÖNECEK VE SHOW DİALOG'A GİDELİM
            Navigator.pop(context,true);
          }, child: Text(Keys.update)
        ),

        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Close')
        )

      ],);
  
}


/////////////////////    


class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {

    return Dialog(
      insetPadding:EdgeInsets.zero ,
      //InteractiveViewer zoom yapabilmeyi sağlıyor
      //photo_view package ile de yapılabilir pubdev bak 
      child: InteractiveViewer(
        child: Image.network(
          _url,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,  
        ),
      ),
    );
  }
}