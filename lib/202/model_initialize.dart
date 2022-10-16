// ignore_for_file: public_member_api_docs, sort_constructors_first
// İNİTİALİZE ETME ÇEŞİTLERİ

class PostModel1 {
  //HEPSİ NULL GELEBİLİR
   int? userId;
   int? id;
   String? title;
   String? body;

}

class PostModel2 {
  //CONSTRUCTOR OLUŞLTURMA
  //DATALAR GELİYOR
   int userId;
   int id;
   String title;
   String body;

  PostModel2(
    this.userId, 
    this.id, 
    this.title, 
    this.body
    );
}

class PostModel3 {
  //BAŞINA FİNAL KOYUNCA SADECE CONSTRUCTOR ANINDA
  //ATAMA YAPABİLİYORUZ
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
  
  
}

class PostModel4 {
  //NAMED ATAMA userId:2 gibi
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId,required this.id,
  required this.title,required this.body});

}

class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;

  PostModel5({required int userId,
  required int id,
  required String title,
  required String body
  }) : _userId=userId, _id=id, _title=title, _body=body;
  
}

class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({required int userId,
  required int id,
  required String title,
  required String body
  })

 {
  int _userId =userId;
  int _id=id;
  String _title=title;
  String _body= body;

} 
 }


class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({ 
    int userId =0,
   int id =0,
   String title='',
   String body=''
  })

 {
  int _userId =userId;
  int _id=id;
  String _title=title;
  String _body= body;

} 
 }


//SERVİCE DATA ÇEKERKEN EN MANTIKLISI BU
class PostModel8 {
   final int? userId;
   final int? id;
   final String? title;
    String? body;

    void updateBody(String? data){
      //kod her zaman check edilmeli
      if(data != null && data.isNotEmpty){
          body = data;
      }
    }

  PostModel8({this.userId, this.id, this.title, this.body});

  //BUNU YAPMAK VERDİĞİMİZ VARİABLERLE  DEĞİŞİK OLANLARI EKLİYOR
  //UPDATE ETMEK İÇİN BU COPYWİTH ÖNEMLİ

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
 }
