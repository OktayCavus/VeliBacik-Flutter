//MİXİN CONSTRUCTOR'I OLMAYAN CLASS
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

//LAUNCHMİXİN'İ SADECE CLASSLARIN KULLANMASINI İSTİYORSAK
// ON WİDGET DİYORUZ
// YANİ ON DİYEREK SINIRLANDIRMA YAPABİLİYORUZ
mixin LaunchMixin/* on Widget*/{
 Future<void> launchUrl(Uri url) async {
  //BU DOĞRU KULLANIM VARSA GİT YOKSA GİTME 
  //BU KULLANIMDA KOD BLOKLANMAZ 
  if(await canLaunchUrl(url)){
    await launchUrl(url);
  }

  /* if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  } */
} 
}