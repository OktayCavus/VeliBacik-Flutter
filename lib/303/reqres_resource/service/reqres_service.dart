

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/resource_model.dart';

//HANGİ SERVİSİ BAĞLAYACĞAIMIZ YAZIYORUZ
abstract class IReqresService{
  //İSTEK ATMAK İÇİN DİO'YA İHTİYAÇ VAR BUNU ADAMDAN ALALIM
  IReqresService(this.dio);
  final Dio dio;

// GERİYE CEVAP DÖNDÜRECEK VE İNTERNETTE ÇIKACAKSA FUTURE
//GERİYE LİST DÖNDÜRECEZ DÖNDÜRECEĞİMİZ MODEL ResourceModel
Future <ResourceModel?> fetchResourceItem();

}

enum _ReqresPath{
  resource
}

class ReqresService extends IReqresService{
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    // get istek atmaya yarıyor dio' ya atıyoruz response bize cevabı sağlıyor
    //final response = await dio.get('/unknown');
    // bu enum ve burayı tam anlamadım her şeyi yazınca aynı servisi döndürüyor
    final response = await dio.get('/${_ReqresPath.resource}');

    if(response.statusCode == HttpStatus.ok){
      final jsonBody = response.data;
      if(jsonBody is Map<String, dynamic>){
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }

}