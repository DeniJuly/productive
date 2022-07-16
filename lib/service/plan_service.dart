import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/model/plan_model.dart';

class PlanService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  double calculate(List<PlanModel> data) {
    int count = data.length;
    int checked = data.where((element) => element.status == true).length;
    if (checked > 0) {
      return ((checked / count) * 100).toDouble();
    } else {
      return 0.0;
    }
  }

  Future<double> calculateProgress() async {
    try {
      QuerySnapshot data = await firestore.collection("plan").get();
      List<PlanModel> dataPlan = data.docs.map((DocumentSnapshot item) {
        return PlanModel.fromJson(item.data() as Map<String, dynamic>, item.id);
      }).toList();
      double progress = calculate(dataPlan);
      return progress;
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<PlanModel>> getPlan() {
    try {
      return firestore.collection("plan").snapshots().map((QuerySnapshot list) {
        var result = list.docs.map<PlanModel>((DocumentSnapshot plan) {
          return PlanModel.fromJson(
              plan.data() as Map<String, dynamic>, plan.id);
        }).toList();
        return result;
      });
    } catch (e) {
      print("ERROR");
      print(e);
      throw Exception(e);
    }
  }

  Future<void> addPlan(Map<String, dynamic> plan) async {
    try {
      firestore
          .collection("plan")
          .add(plan)
          .then((value) => print("berhasil tambah plan"));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updStatusPlan(String id, bool status) async {
    try {
      firestore.collection("plan").doc(id).update({
        "status": status,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delPlan(String id) async {
    try {
      firestore
          .collection("plan")
          .doc(id)
          .delete()
          .then((value) => print("berhasil hapus data plan"));
    } catch (e) {
      throw Exception(e);
    }
  }
}
