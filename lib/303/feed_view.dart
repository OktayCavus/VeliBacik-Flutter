import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/Services/post_service.dart';

import '../202/Services/post_model.dart';

// BU SAYFA AÇILIR AÇIMLAZ SERVİSE İSTEK ATMAK İSTOYURZ


class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

/////////////////////////////////////

// with AutomaticKeepAliveClientMixin BU VE
// BUNUN CREATİNG MİSSİNG 75.SATIR
// super.build(context);
// ÖNEMLİ KORUMAYA ALMIŞ OLDUK 
// HER O SAYFAYA DÖNDÜĞÜMÜZDE İSTEK ATIYOR TEKRARDAN 
// BU 3 KOD BUNU ENGELLİYOR
class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin{

  final IPostService _postService = PostService();

  // 45 çözümü 30 ve 37 arası

 late final Future<List<PostModel>?> _itemsFuture;

  @override
  void initState() {
    super.initState();

    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {

    super.build(context);

    return Scaffold(
      // her düğmeye basılınca tekrar istek atıyor bunu yapmasını istemiyorsak
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(onPressed:(){
        setState(() {
          
        });
      }),

      appBar: AppBar(),

      // fetchPostItemsAdvance BİZE FUTURE DÖNDÜĞÜ İÇŞN
      //FutureBuilder<List<PostModel>?> döndürdüğü tipi fetchPostItemsAdvance
      //gördükte yzdık
      //  read only bir sayfaysa FutureBuilder harika bir çözüm
      body: _FeedFutureBuilder(itemsFuture: _itemsFuture),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    Key? key,
    required Future<List<PostModel>?> itemsFuture,
  }) : _itemsFuture = itemsFuture, super(key: key);

  final Future<List<PostModel>?> _itemsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      // 45 devam future ' e bunu vermek yerine _itemsFuture bunu veririz
      //future: _postService.fetchPostItemsAdvance() ,
      future: _itemsFuture,
      //builder içindeki snapshoot'a hangi modeli döneceksek onu yazıyoruz
      builder: (
        BuildContext context,
       AsyncSnapshot<List<PostModel>?> snapshot) {

          switch (snapshot.connectionState) {
            // İNTERNET YOKKEN
            case ConnectionState.none:
            //bir hata varsa placeholder dönecek
              return Placeholder();

              //İNTERNETİ BEKLERKEN
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);

              //AKTİFKEN
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator(),);

              //BİTTİĞİNDE 
            case ConnectionState.done:
            // hata yoksa buraya düştü
            //TRUE İSE snapshot.hasData DATA VAR DEMEKTİR
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        //?? '' bunu koymazsak bu hatayı alıyoruz
                        //The argument type 'String?' can't be assigned to the parameter type 
                        title: Text(snapshot.data?[index].body ?? ''),),
                    );
                  },
                );
              }else  return Placeholder();

          }
      },
    );
  }
}