// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
    late final List<CollectionModel> _items;


 @override
  void initState() {
    super.initState();
    _items = CollectionsItems().items;

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: PaddingUtility().PaddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
        return _CatagoryCard(model:_items[index]);
      },),
       
    );
  }
}

class _CatagoryCard extends StatelessWidget {
   _CatagoryCard({
    Key? key,
    required CollectionModel model,
  }) : _model = model, super(key: key);

  final _PaddingUtility= PaddingUtility();

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _PaddingUtility.PaddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: _PaddingUtility.PaddingGeneral,
          child: Column(children: [
            Expanded(child: Image.asset(_model.imgPath)),
            Padding(
              padding: _PaddingUtility.PaddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment .spaceBetween,
                children: [
                  Text(_model.title),
                  Text('${_model.price} eth')
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}



class CollectionModel {
  final String imgPath;
  final String title;
  final double price;

  CollectionModel({
    required this.imgPath,
    required this.title,
    required this.price,
  });
}

class PaddingUtility{
  final PaddingTop =const EdgeInsets.only(top: 10);
  final PaddingBottom =EdgeInsets.only(bottom: 20);
  final PaddingGeneral =const EdgeInsets.all(20);
  final PaddingHorizontal =EdgeInsets.symmetric(horizontal: 20);
}

class CollectionsItems{
   late final List<CollectionModel> items;

  CollectionsItems(){
        items =[
      CollectionModel(imgPath: imageProject().imgCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imgPath: imageProject().imgCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imgPath: imageProject().imgCollection, title: 'Abstract Art', price: 3.4)];
  }
}


class imageProject{
  final String imgCollection='assets/png/dice.png';
}