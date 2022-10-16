

import 'package:dio/dio.dart';
// SİNGLETON 
class ProjectNetworkManager {
  late final Dio _dio ;
// ._ private demek
  ProjectNetworkManager._(){
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));


  }

//singleton yapma 
  static ProjectNetworkManager instance=ProjectNetworkManager._();

  Dio get service => _dio;

  void addBaseHeaderToToken (String token) {
    _dio.options = _dio.options.copyWith(
      headers: {
        "Authorization": token
      },
    );
  }
}

class DurationManager  {
  DurationManager._();

  static DurationManager? _manager ;

  static DurationManager get manager {
     if(_manager != null) return _manager!;
     _manager = DurationManager._();
     return _manager!;
  }

}