import 'dart:convert';

/// final String seatCode;
///  final String price;
///  final String cmpClass;
class TrainClassModel {
  final String seatCode;
  final String price;
  final String cmpClass;
  TrainClassModel({
    required this.seatCode,
    required this.price,
    required this.cmpClass,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seat_code': seatCode,
      'price': price,
      'cmp_class': cmpClass,
    };
  }

  factory TrainClassModel.fromMap(Map<String, dynamic> map) {
    return TrainClassModel(
      seatCode: map['seat_code'] as String,
      price: map['price'] as String,
      cmpClass: map['cmp_class'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainClassModel.fromJson(String source) =>
      TrainClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
