import 'package:flutter_application_2/303/reqres_resource/model/resource_model.dart';

class resourceContext{
  ResourceModel? model ;

  void saveModel(ResourceModel? model){
    this.model = model;
  }

  void remove(){
    model = null;
  }
}