

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/image_learn_202.dart';
import 'package:flutter_application_2/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_2/303/reqres_resource/viewModel/req_res_provider.dart';
import 'package:flutter_application_2/product/extension/string_color_extension.dart';
import 'package:flutter_application_2/product/global/resource_context.dart';
import 'package:flutter_application_2/product/global/theme.notifier.dart';
import 'package:flutter_application_2/product/service/project_Dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';
import '../viewModel/reqres_view_model.dart';

class ReqresViewLearn extends StatefulWidget {
  const ReqresViewLearn({Key? key}) : super(key: key);

  @override
  State<ReqresViewLearn> createState() => _ReqresViewLearnState();
}

class _ReqresViewLearnState extends /*ReqresViewModel*/ State<ReqresViewLearn> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  //ChangeNotifierProvider ile sarmalamak ekrana haber verceğiz demek
  Widget build(BuildContext context) {
    // PROVİDER'I BURDA KULLANMAK İÇİN SCAFOLDU ile ChangeNotifierProvider SAR
    return ChangeNotifierProvider<ReqresProvider>(
      
      create: (context) {
        return ReqresProvider(ReqresService(service));
      },
      
      // EKRANDAN ETKİLENECEKSE BUİLDER VERİRİZ
    
      builder: (context, child) {
        return Scaffold(
         appBar: AppBar(
          actions: [
            _saveAndNavigateWidget()
          ],
          //title: isLoading ? CircularProgressIndicator() : null,
          //provider'dan sonra
  /// watch notifyListener'(ReqresProvider içinde) hepsini dinlicem demek read 1 defa
          title: context.watch<ReqresProvider>().isLoading ?CircularProgressIndicator() : null,
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.read<ThemeNotifier>().changeTheme();          }),

    //List<Data> items ekledikten sonra context.watch<ReqresProvider>().resources buraya ekledik
        body: Column(
          children: [
         /// consumer ve selector var state içinde belli durumları
         /// inceleyeceğimiz zaman kullanıyoruz
         /// Placeholder isLoading true iken açık false kapalı
         // selector hangi senaryoda çalışacağını söylyürz
  // <ReqresProvider,bool> bu ifade provider var ve içindeki 
  //bool durumu dinlemek  istiyorum demek 

         _tempPlaceHolder(),

          Expanded(child: _resourceListView(context,context.watch<ReqresProvider>().resources)),
          ],
        ), 
      );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        // STATE'İN(ReqresViewModel) İÇERİSİNDE NE VARSA 
        //önce
        //itemCount: context.watch<ReqresProvider>().resources.length,
        // List<Data> items ekledikten sonra
        itemCount:items.length,
        itemBuilder: (BuildContext context, int index) {
          // resources.data.name gibi bir şey oldu alttaki kod
        
          
          return Card(color: Color(items[index].color?.colorValue ?? 0) ,
          child: Text(items[index].name ?? '')
          );
        },
      );
  }
}

class _saveAndNavigateWidget extends StatelessWidget {
  const _saveAndNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      // reqresProvider' dinle savetoLocale yap 
      //resourceContext içindekileri dinle ve kaydet 
      context.read<ReqresProvider>().saveToLocale(context.read<resourceContext>());
      //BAŞKA SAYFAYA YÖNLENDİRMEYİ SAĞLIYOR
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return imageLearn202();
      }));
    }, 
    child: Icon(Icons.ac_unit_outlined));
  }
}

class _tempPlaceHolder extends StatelessWidget {
  const _tempPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider,bool>(builder: (context, value, child) {
      return value ? Placeholder() : Text('Data');
      },
      //bırdaki provider ReqresProvider'dan gelen
     selector:(context, provider){
       return provider.isLoading;
     } );
  }
}