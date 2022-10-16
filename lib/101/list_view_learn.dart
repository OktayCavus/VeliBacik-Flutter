import 'package:flutter/material.dart';

//LİSTVİEW BİR WİDGET İÇİNE GİRİP ÇIKIYOR DEBUG CONSOLE AÇ 
//ALTTA YAZILAN İNİSTATE VE DİSPOSE' PRİNTLERİNE BAK SAYFA 
//ALTA KAYINCA HELLO YIKARI ÇIKINCA EXİT VERİYOR
// BU BİZİ DEĞER YOLLAMA GİBİ DURUMLARDA İLGİLENDİRİYOR ÇÜNKÜ
//LİST VİEWDAN ÇIKARKEN DEĞERİ SIFIRLAMAMIZ GEREKEBİLİR

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      //LİST VİEW HEİGHT VE WİDTH OLARAK SONSUZDUR 
      //BİZDE WİDTH DEĞERİNE GÖRE SINIRLANDIRMA YAPARAK KULLANIRIZ

      body : ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text('Merhaba',
            style: Theme.of(context).textTheme.headline1,
            maxLines: 1,),
          ),

          Container(color: Colors.red,height: 300,),

            Divider(),

            //LİSTVİEW SONSUZA KADAR GİDER ONA GÖRE AYARLIYORUZ
            //HEİGHT VEYA WİDTH VERECEĞİMİZİ DÜŞÜN 
            //LİSTVİEW'İ yatayda YAPACAKSAK HEİGHT VERMEMİZ LAZIM
            //BU YÜZDEN SİZEDBOX İÇİNE KOYUYORUZ
            //VE yatayda OLMASI İÇİN scrollDirection İLE horizontal
            //YAPMALIYIZ

            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              ],),
            ),

            IconButton(onPressed: () {}, icon: Icon(Icons.close)),

            //AAAAAAA

            FittedBox(
            child: Text('Merhaba',
            style: Theme.of(context).textTheme.headline1,
            maxLines: 1,),
          ),

          Container(
            color: Colors.red,
            height: 300,),

            Divider(),

            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              ],),
            ),

            IconButton(onPressed: () {}, icon: Icon(Icons.close)),

          _ListDemo()
          
        ],
      ),
    );
  }
}


class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<_ListDemo> {

@override
  void initState() {
    super.initState();
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('exit');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}