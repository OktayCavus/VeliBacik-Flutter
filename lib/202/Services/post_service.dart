

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/202/Services/comment_model.dart';

import 'post_model.dart';

abstract class IPostService{
  Future<bool> addItemToService(PostModel model);
  Future<bool> updateItemToService(int id);
  Future<bool> deleteItemToService(PostModel model,int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);

}

class PostService implements IPostService{
 final Dio _dio;
  PostService():_dio=Dio(BaseOptions(baseUrl:'https://jsonplaceholder.typicode.com/' ));

   @override
     Future<bool> addItemToService(PostModel model) async {
      try {
            final response = await _dio.post(_PostServicePath.posts.name,data: PostModel);

   return response.statusCode == HttpStatus.created;
      } catch (_) {
        return false;
      }
  }

  @override
  Future<bool> updateItemToService(int id) async {
      try {
            final response = await _dio.put('${_PostServicePath.posts.name}/$id',data: PostModel);
// ok created falan var onları araştır
   return response.statusCode == HttpStatus.ok;
      } catch (_) {
        return false;
      }
  }

  @override
  Future<bool> deleteItemToService(PostModel model,int id) async {
      try {
            final response = await _dio.put('${_PostServicePath.posts.name}/$id');
// ok created falan var onları araştır
   return response.statusCode == HttpStatus.ok;
      } catch (_) {
        return false;
      }
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance()  async {
    
    try {
      final response = await _dio.get(_PostServicePath.posts.name);

    if(response.statusCode==HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
          return  _datas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    } catch (_) {
      print('a');
      
    }return null;
  }
  
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      //burda 15 gibi bir ıd var queryParameters kullan postman'den bakıyoruz
      final response = await _dio.get(_PostServicePath.comments.name,
      queryParameters: {_PostQueryPath.postId.name : postId}
      
      );

    if(response.statusCode==HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
          return  _datas.map((e) => CommentModel.fromJson(e)).toList();
      }
    }
    } catch (_) {
      print('a');
      
    }return null;
  }
}


enum _PostServicePath{
  posts,comments
}

enum _PostQueryPath{
  postId
}