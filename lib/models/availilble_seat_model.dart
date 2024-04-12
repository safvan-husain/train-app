// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AvailibeSeat {
  final String date;
  final String waitingCategory;
  final String price;
  final bool isTaktal;
  AvailibeSeat({
    required this.date,
    required this.waitingCategory,
    required this.price,
    required this.isTaktal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'waiting_category': waitingCategory,
      'price': price,
      'is_taktal': isTaktal,
    };
  }

  factory AvailibeSeat.fromMap(Map<String, dynamic> map) {
    return AvailibeSeat(
      date: map['date'] ?? 'not provided',
      waitingCategory: map['waiting_catergory'] ?? 'not provided',
      price: map['price'] ?? 'not provided',
      isTaktal: map['is_taktal'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailibeSeat.fromJson(String source) =>
      AvailibeSeat.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<AvailibeSeat> fromMapList(List<dynamic> mapList) {
    List<Map<String, dynamic>> result =
        mapList.map((e) => e as Map<String, dynamic>).toList();
    return result.map((e) => AvailibeSeat.fromMap(e)).toList();
  }
}
