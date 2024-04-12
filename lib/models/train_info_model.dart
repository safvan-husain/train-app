import 'dart:convert';

import 'package:train_app/models/train_class_mode.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TrainInfoModel {
  final String trainName;
  final String trainNumber;
  final String duration;
  final String runningDays;
  final List<TrainClassModel> seats;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;

  TrainInfoModel({
    required this.trainName,
    required this.trainNumber,
    required this.duration,
    required this.runningDays,
    required this.seats,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'train_name': trainName,
      'train_number': trainNumber,
      'duration': duration,
      'running_days': runningDays,
      'seats': seats.map((x) => x.toMap()).toList(),
    };
  }

  factory TrainInfoModel.fromMap(Map<String, dynamic> map) {
    return TrainInfoModel(
      trainName: map['train_name'] as String,
      trainNumber: map['train_number'] as String,
      duration: map['duration'] as String,
      runningDays: map['running_days'] as String,
      startDate: map['start_date'],
      endDate: map['end_date'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      seats: List<TrainClassModel>.from(
        (map['seats'] as List<dynamic>).map<TrainClassModel>(
          (x) => TrainClassModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  factory TrainInfoModel.fromJson(String source) =>
      TrainInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<TrainInfoModel> fromMapList(List data) {
    return data.map((e) => TrainInfoModel.fromMap(e)).toList();
  }
}
