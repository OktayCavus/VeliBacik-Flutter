
import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/image_learn.dart';
import 'package:flutter_application_2/101/list_view_learn.dart';
import 'package:flutter_application_2/202/image_learn_202.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({Key? key}) : super(key: key);

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,

      body: Center(child: TextButton(onPressed: () {
          showCustomSheet(context, ListViewLearn());
      },
       child: Text('Show')),),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //await atmak demek bu işlem bittiğinde gelen sonucu kontrol edecez
          //if komutu oluyor o kontrolde
          final result =await showModalBottomSheet(context: context, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // true yaparsak full açılır bottomsheet
          builder: (context){
            return 
              //height ve içindeki kod ekranın %70 ini kapla demek
              // column' wrapwidget deyip sizedbox içerisine almamız lazım
              //height i kullanmak için
              //height:MediaQuery.of(context).size.height*0.7,
               _CustomSheet(backgroundColor: _backgroundColor);
          }//builder
          ); //showmodelbottomsheet
          //inspect(result); gelen sonucu kontrol etmek için
          if(result is bool){
            //sadece ok tuşuna basarsa buraya girer
            setState(() {
              _backgroundColor= Colors.cyan;
            });
          }
        },
        child:const Icon(Icons.share),
      
      )
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);



  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
   Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
         //mainaxissize ile içerisinde bulunan widgetların boyu kadar
         //açılıyor bottomsheet
         mainAxisSize: MainAxisSize.min,
         children: [

           SizedBox(
            height: 24,
             child: Stack(
               children: [
                 Divider(color: Colors.black, thickness: 3,
                     indent:MediaQuery.of(context).size.width*0.45,
                     endIndent: MediaQuery.of(context).size.width*0.45,
                     ),
                     Positioned(
              top: 0,
              right: 10,
              child: InkWell(onTap: () {
                Navigator.of(context).pop();
              }, 
              child: Icon(Icons.close)))
               ],
             ),
           ),
           
           const Text('data'),
           
           Image.network('https://picsum.photos/200/300',
           height: 200,),
           
           ElevatedButton(onPressed: () {
             // sheeti kapatmaya yarıyor
             //ok ' a basınca kapanacak
             //üstteki result is bool ile alakalı
             Navigator.of(context).pop<bool>(true);
             //setState burda yazılmaz
              setState(() {
               _backgroundColor = Colors.amber;
             }); 
           }, 
           child:const Text('OK'))
    
         ],
            ),
      ),
    );
  }
}


//her ekranda sheet olacağı için ortaklaştırmamız lazım
//bir method prop  almayacak ve sadece function üretecekse mixin yapıyoruz
//FUTURE FALAN showCustomSheet ve showModalBottomSheet isimleri üzerine bakarak
//bizden istenene göre verdik
mixin ProductSheetMixin{
  Future<T?> showCustomSheet<T>(BuildContext context,Widget child) async {
    return showModalBottomSheet<T>(
          context: context, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // true yaparsak full açılır bottomsheet
          isScrollControlled: true,
          builder: (context){
            return 
              //height ve içindeki kod ekranın %70 ini kapla demek
              // column' wrapwidget deyip sizedbox içerisine almamız lazım
              //height i kullanmak için
              //height:MediaQuery.of(context).size.height*0.7,
              _CustomMainSheet(child: child);
          }//builder
          );
  }
}



// burda setState olmayacak ve ortak bir kullanım bize sunacak
class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
         //mainaxissize ile içerisinde bulunan widgetların boyu kadar
         //açılıyor bottomsheet
         mainAxisSize: MainAxisSize.min,
         children: [
           _BaseSheetSizedBoxHeader(),
           //bize gönderilen child'ı burda verdik
           Expanded(child: child)
         ],
            ),
      ),
    );
  }
}

//her yerde kullanacağımız için sizedBox'ı dışarı aldık
class _BaseSheetSizedBoxHeader extends StatelessWidget {
  const _BaseSheetSizedBoxHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 24,
      child: Stack(
        children: [
          Divider(color: Colors.black, thickness: 3,
              indent:MediaQuery.of(context).size.width*0.45,
              endIndent: MediaQuery.of(context).size.width*0.45,
              ),
              Positioned(
       top: 0,
       right: 10,
       child: InkWell(onTap: () {
         Navigator.of(context).pop();
       }, 
       child: Icon(Icons.close)))
        ],
      ),
    );
  }
}




/* import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({Key? key}) : super(key: key);

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //await atmak demek bu işlem bittiğinde gelen sonucu kontrol edecez
          //if komutu oluyor o kontrolde
          final result =await showModalBottomSheet(context: context, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // true yaparsak full açılır bottomsheet
          isScrollControlled: true,
          builder: (context){
            return 
              //height ve içindeki kod ekranın %70 ini kapla demek
              // column' wrapwidget deyip sizedbox içerisine almamız lazım
              //height i kullanmak için
              //height:MediaQuery.of(context).size.height*0.7,
               _CustomSheet(backgroundColor: _backgroundColor);
          }//builder
          ); //showmodelbottomsheet
          //inspect(result); gelen sonucu kontrol etmek için
          if(result is bool){
            //sadece ok tuşuna basarsa buraya girer
            setState(() {
              _backgroundColor= Colors.cyan;
            });
          }
        },
        child:const Icon(Icons.share),
      
      )
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);



  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
   Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
         //mainaxissize ile içerisinde bulunan widgetların boyu kadar
         //açılıyor bottomsheet
         mainAxisSize: MainAxisSize.min,
         children: [

           SizedBox(
            height: 24,
             child: Stack(
               children: [
                 Divider(color: Colors.black, thickness: 3,
                     indent:MediaQuery.of(context).size.width*0.45,
                     endIndent: MediaQuery.of(context).size.width*0.45,
                     ),
                     Positioned(
              top: 0,
              right: 10,
              child: InkWell(onTap: () {
                Navigator.of(context).pop();
              }, 
              child: Icon(Icons.close)))
               ],
             ),
           ),
           
           const Text('data'),
           
           Image.network('https://picsum.photos/200/300',
           height: 200,),
           
           ElevatedButton(onPressed: () {
             // sheeti kapatmaya yarıyor
             //ok ' a basınca kapanacak
             //üstteki result is bool ile alakalı
             Navigator.of(context).pop<bool>(true);
             //setState burda yazılmaz
              setState(() {
               _backgroundColor = Colors.amber;
             }); 
           }, 
           child:const Text('OK'))
    
         ],
            ),
      ),
    );
  }
} */
