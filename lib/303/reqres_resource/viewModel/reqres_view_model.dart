

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_2/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_application_2/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_2/product/service/project_network_manager.dart';

import '../../../product/service/project_Dio.dart';
import '../view/reqres_view.dart';

// changeLoading kullanabilmek için LoadingStateful'dan türettik
abstract class ReqresViewModel extends LoadingStateful<ReqresViewLearn> /*State<ReqresViewLearn>*/with ProjectDioMixin{

  // sadece IReqresService bunun ögelerini görmek için bundan türetiyoruz
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
  
// dioyu service ' e atıp bütün proje boyunca yazmaktan kurtulduk
    //reqresService = ReqresService(service);
    //singleton'dan sonra bu sayede datalar ortaklaşmış oldu
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('Veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
  
}