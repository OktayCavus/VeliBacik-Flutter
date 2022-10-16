

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_2/product/global/resource_context.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqresProvider extends ChangeNotifier {
  // SAYFALAR ARASI VERİ AKTARIMINI SAĞLIYOR
  // BELLİ YERLERE DOKUNABİLİYORUZ 

   final IReqresService reqresService;

   

  List<Data> resources = [];
// AÇILINCA İSTEK ATMAK İSTİYORSAK BURDA ATIYORUZ

  bool isLoading = false ;
   
   void _changeLoading() {
    isLoading = !isLoading ;
    notifyListeners();
   }


  ReqresProvider(this.reqresService){
      _fetch();
  }
// PROVİDER OLDUĞU İÇİN İNİT STATE YOK BURDA 

  /* @override
  void initState() {
    super.initState();
// dioyu service ' e atıp bütün proje boyunca yazmaktan kurtulduk
    reqresService = ReqresService(service);

    _fetch();
  }*/

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(resourceContext resourceContext){
      resourceContext.saveModel(ResourceModel(data: resources));
  }
}
