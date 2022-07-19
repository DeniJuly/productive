class PlanModel {
  String? title;
  String? location;
  String? startDate;
  String? endDate;
  String? docId;
  bool? status;

  PlanModel({
    this.title,
    this.location,
    this.startDate,
    this.endDate,
    this.docId,
  });

  PlanModel.fromJson(Map<String, dynamic> json, String id) {
    title = json['title'];
    location = json['location'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    docId = id;
    status = json['status'];
  }
}
