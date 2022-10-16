

extension ColorStringExtension on String? {

// bize datadan color #423DF4 gibi dönüyor biz bunu direkt 
  // kullanamayız bunu önce stringe sonra int'e çevirelim
  // sadece çağırıldığına çalışacak bu yüzden get yazıyoruz
  int get colorValue {  
    //this color anlamına geliyor adamdan geleceği için this dedik
    var _newColor = this?.replaceFirst('#','0xff') ?? '';
    return int.parse(_newColor) ;
  }


}