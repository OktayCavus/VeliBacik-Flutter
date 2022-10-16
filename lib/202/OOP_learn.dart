


import 'dart:io';

import 'package:flutter_application_2/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';
// BİRKAÇ TANE YAPACAKSAK FARKLI PARAMETRELER İLE FALAN ABSTRACT
//SONRA ONLARI ÇAĞIRARAK GÖVDELERİNİ DOLDURURUZ
//implements anasınıfın bütün özelliklerini değiştiriyoruz
//extends ana özellikleri kabul ediyoruz diğerlerini değiştiriyoruz

abstract class IFileDownload  {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    Uri uriPath = Uri.parse(path);
    await launchUrl(uriPath);
  }
}



// FİLE DOWNLOAD CLASS'INI SADECE FİLEİTEM KULLANSIN İSTİYORUZ SADECE
class FileDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem){
    if(fileItem == null)throw fileDownloadException();
      //fileDownloadException bizim özelleştirdiğimiz exception
        
    
    }
}

class SMSDownload implements IFileDownload{
  @override
  bool? downloadItem(FileItem? fileItem){
    if(fileItem == null)throw fileDownloadException();
      //fileDownloadException bizim özelleştirdiğimiz exception
        
    
    }
    
      @override
      Future<void> toShare(String path) async {
        Uri smsPath = Uri.parse('sms:+90$path');
        
            await launchUrl(smsPath);

      }
}


class FileItem{
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

// ON İLE KISITLANDIRMA YAPTIK
//SADECE IFileDownload'DAN TÜREYENLER KULLANABİLİR 
//EXTENDS EDİLEN KILLANIR İMPLEMENT KULLANAMAZ
//KULLANMAK İÇİN WİTH KULLANIYORUZ
mixin ShareMixin on IFileDownload {
  void toShowFile(){}
}