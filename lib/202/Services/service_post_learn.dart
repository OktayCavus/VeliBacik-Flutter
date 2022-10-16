


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/Services/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  late final Dio _dio;
  final String _baseUrl='https://jsonplaceholder.typicode.com/';

  String? name;

  bool _isLoading = false;

  TextEditingController _titleController=TextEditingController();
  TextEditingController _bodyController=TextEditingController();
  TextEditingController _userIdController=TextEditingController();

  
  @override
  void initState() {
    super.initState();
    _dio=Dio(BaseOptions(baseUrl: _baseUrl));
    }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel model) async {
    _changeLoading();
    final response = await _dio.post('posts',data: PostModel);
  
    if(response.statusCode == HttpStatus.ok){
        name ='basarili';
    }
    _changeLoading();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
        _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
      ],),

      body: Column(children: [
           TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'title'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
          ),
           TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'body'),),
           TextField(
            controller: _userIdController,
            keyboardType:TextInputType.number ,
          autofillHints: [AutofillHints.creditCardNumber],
          decoration: InputDecoration(labelText: 'userId'),),
          
          TextButton(
            onPressed:
            _isLoading ? null :
            () {
            if(_titleController.text.isNotEmpty && 
            _bodyController.text.isNotEmpty && 
            _userIdController.text.isNotEmpty) 
            {
              final model = PostModel(body: _bodyController.text ,
              title: _titleController.text,
              userId: int.tryParse(_userIdController.text));


              _addItemToService(model);
            }
          },  child: Text('Send'))

      ],),
    );
  }
}

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
        title:Text(_model?.title ?? ''),
        subtitle:Text(_model?.body ?? ''),
        ),
    );
  }
}