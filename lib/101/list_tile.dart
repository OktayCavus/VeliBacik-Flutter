import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/core/random_image.dart';

import '../core/random_image.dart';

class listTileLearn extends StatelessWidget {
  const listTileLearn({Key? key}) : super(key: key);

  final imageUrl='https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Card ile sardım sektörde listTile ve Card beraber kullanılıyor bu şekilde
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  //bunu sayfanın main kısmında yapıyoruz çünkü comp. padding biz belirlemek isteriz
                  //contentPadding: EdgeInsets.zero,
                  //componenti olabildiği kadar sıkıştırmaya yarıyor dense
                  //dense: true,
                  title: randomImage(),
                  // TIKLAMA İLE BİR YERE GİTMEK İSTİYORSAK ONTAP KULLANILIR
                  onTap:() {}, 
                  subtitle:Text('How do you use your card'),
                  //sola bir şey koymak için leading prop kullanılır
                  leading: Icon(Icons.money) ,
                  //sağa bir şey koymak için trailing
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}