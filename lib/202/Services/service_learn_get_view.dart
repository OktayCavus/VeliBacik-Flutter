


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/Services/comments_learn_view.dart';
import 'package:flutter_application_2/202/Services/post_model.dart';
import 'package:flutter_application_2/202/Services/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  late final Dio _dio;
  final String _baseUrl='https://jsonplaceholder.typicode.com/';
//TEST EDİLEBİLİR KOD BAŞLADI
  late final IPostService _postService;

  bool _isLoading = false;
  
  List<PostModel>? _items;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _dio=Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItemsAdvance();
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

//DATAYI İSTEDİK VE ALDIK METOTLA fetchPostItems
//    REQUEST ATMA
  Future<void> fetchPostItems()  async {
    _changeLoading();
    //BURDAKİ SETSTATE KODU ASYNC OLDUĞU İÇİN ALTTAKİ ONU GEÇEMEZ BİTMESİ LAZIM

/*     setState(() {
      _isLoading = true;
    }); */
    //await ve async bu kodu bekle alta geçme demek
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
//   dart.io dan gelen httpStatus.ok html'den gelen değil 
    if(response.statusCode==HttpStatus.ok){
      final _datas = response.data;
  // burdaki if 'i kullanma amacımız _datas için bütün methodları kullanmak
  //if dışında yazınca gelmiyor herhangi bir şey 
  //datas' ın içindekileri mapleyerek yeni bir liste yapmaya çalışuıyoruz
  //postModel içindeki fromJson var onunla yapıyoruz
      if(_datas is List){
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
        //ZATEN İFLERDEN ÇIKARSA FALSE ÇEKERİZ 
        //SAĞ ÜSTTEKİ PROGRESS OLMUŞ OLUR
/*      setState(() {
      _isLoading = false;
    }); */
    _changeLoading();
  }


  /* Future<void> fetchPostItemsAdvance()  async {
    _changeLoading();
    
    final response = await _dio.get('posts');

    if(response.statusCode==HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }

    _changeLoading();

  } */

  Future<void> fetchPostItemsAdvance()  async {
    _changeLoading();
    
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(actions: [
        _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
      ],),

      body:_items == null ? const Placeholder() : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          //GELEN DATALARI GÖRELİM 
        return _PostCards(
          model: _items?[index]);
          
      },),
    );
  }
}

/* class _PostCards extends StatelessWidget {
  const _PostCards({
    Key? key,
    required List<PostModel>? items,
  }) : _items = items, super(key: key);

  final List<PostModel>? _items;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title:Text(_items?[index].title ?? ''),
        subtitle:Text(_items?[index].body ?? ''),
        ),
    );
  }
} */

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//ÜSTTEKİ İLE FARKINA BAK ÜSTTE ARRAY YOLLUYORUZ ALTTA YOLLAMIYORUZ
//ÖNEMLİ BİR KULLANIM
class _PostCards extends StatelessWidget {
  const _PostCards({
    Key? key,
    required PostModel? model,
  }) : _model = model, super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsLearnView(postId:_model?.id ),));
        }, 
        title:Text(_model?.title ?? ''),
        subtitle:Text(_model?.body ?? ''),
        ),
    );
  }
}