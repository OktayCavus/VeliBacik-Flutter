import 'package:flutter/material.dart';

class StatefulLifecycleLearn extends StatefulWidget {
  const StatefulLifecycleLearn({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  State<StatefulLifecycleLearn> createState() => _StatefulLifeLearnState();
}

class _StatefulLifeLearnState extends State<StatefulLifecycleLearn> {
  String _message='';
  late final bool _isOdd;
  //CONSTRUCTOR ANINDA DEĞERİ DEĞİŞECEĞİ İÇİN LATE KOYDUK

  // message tekse yanına tek çiftse çift yazılacak burda _isOdd ile bir alaka olmadığı için
  //onu final yapıyoruz
//INITSTATE PROP didChangeDependencies initstate'ten sonra çalışır
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('cc');
    
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    //oldWidget bir önceki seçenek gibi düşünelim
    print('b');
    
  }

  @override
  //SAYFA BİTTİKTEN SONRA ÖLDÜRMEYİ YARAYAN PROP
  void dispose() {
    super.dispose();
    print('alo');
    _message='';
  }


//İNİTSTATE CONSTRUCTORLAR GİBİ PROJEDE EN ÖNCE AYARLANIR ONDAN SONRA PROJE KALINIR
  @override
  //INISTATE LİFECYLE PROPERTY'Sİ
  void initState() {
    super.initState();
    _message=widget.message;
    _isOdd=widget.message.length.isOdd;
    print('a');
    _computeName();

      
  }
// BU KODU İNİTSTATE İÇİNDE YAZMAMAIZ LAZIM dışarda yazıp orda çağırırz
  void _computeName() {
    _isOdd ? _message+="Teka":_message+="Cift";
    /* if(_isOdd) {
       _message+='Tek';
    }else {
      _message+='Cift';
    } */
    //GALİBA UYGULAMA HER ÇALIŞTIĞINDA ÇALIŞIYOR DEĞİŞİKLİK OLDUĞUNDA OLMIYOR ÇÜNKÜ
    //SET STATE KULLANMAMIZA GEREK YOK ÇÜNKÜ İNİTSTATE'TEN SONRA KOD ÇALIMŞADAN BU DA
    //HESAPLANMIŞ OLUYOR EVENTLOOP 
    //çünkü initState'in bir methodu 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //MESSAGE'E ERİŞMEK İÇİN WİDGET KULLANILIYOR
        //isOdd TEK HARFTEN Mİ OLUŞUYOR ÇİFT Mİ ONA BAKAR
        title: /* widget.message.length.isOdd ? Text('tek') : Text('cift') */
        //_isOdd? Text('tek') : Text('cift'),
        Text(_message)
      ),

      body: //widget.message.length.isOdd ? TextButton(onPressed: () {
        _isOdd? TextButton(onPressed: () {}, child: Text(/* widget.message */ _message) ) 
        : ElevatedButton(onPressed: () {}, child: Text(/* widget.message */ _message))
    );
  }
}