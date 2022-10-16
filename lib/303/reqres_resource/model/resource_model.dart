

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// JsonSerializable ÜRETİM YAPACAĞIMIZ CLASSLARIN BAŞINA EKLENİYOR
 // sonra part ve dosya adı ve sonra watch'a bas
// mesela müşteri geldi dedi ki String price var 
//onu burda yazıyoruz buildRunner g.dart onu ekliyor gereken yerlere
part 'resource_model.g.dart';

/// KOD GENERATOR MANTIĞINI ÖĞREN (JsonSerializable VE ANNOTATİON )
@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

 factory ResourceModel.fromJson(Map<String, dynamic> json) {
/*     if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    } */

    return _$ResourceModelFromJson(json);
  }


  Map<String, dynamic> toJson() {
/*     final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data; */

    return _$ResourceModelToJson(this);
  }
}
// Equatable bizim yerimize eşitliği kontrol eder
//en altta kodda id ve name aynı olan eşittir demek
@JsonSerializable()
class Data extends Equatable{
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  const Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  
  //başa factory yazıyoruz ve 
  factory Data.fromJson(Map<String, dynamic> json) {
/*     id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value']; */

    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
/*     final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['color'] = this.color;
    data['pantone_value'] = this.pantoneValue;
    return data; */

        // buildRunner'dan sonra (annotation ve jsonSerializer)
    return _$DataToJson(this);
  }
  //bu equatable
  @override
  List<Object?> get props => [id,name];
}
