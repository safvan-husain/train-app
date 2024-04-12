import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationModel {
  final String title;
  final String content;
  NotificationModel({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<NotificationModel> fromMapList(List<dynamic> mapList) {
    List<Map<String, dynamic>> result =
        mapList.map((e) => e as Map<String, dynamic>).toList();
    return result.map((e) => NotificationModel.fromMap(e)).toList();
  }
}
