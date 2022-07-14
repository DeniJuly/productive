import 'package:flutter/material.dart';

class PlanModel {
  String? title;
  String? location;
  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;
  int? id;
  bool? status;

  PlanModel({
    this.title,
    this.location,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.id,
  });

  PlanModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    location = json['location'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    id = json['id'];
    status = json['status'];
  }
}
