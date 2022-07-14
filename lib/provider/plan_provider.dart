import 'package:flutter/material.dart';
import 'package:productive/model/plan_model.dart';

class PlanProvider with ChangeNotifier {
  List<PlanModel> _plans = [];
  double _checked = 0;
  double _unChecked = 100.0;

  List<PlanModel> get plans => _plans;

  double get checked => _checked;
  double get unChecked => _unChecked;

  set wishlist(List<PlanModel> plans) {
    _plans = plans;
    notifyListeners();
  }

  List<PlanModel> todayPlan() {
    List<PlanModel> newPlans = _plans;
    DateTime date = DateTime.now();
    newPlans.firstWhere((e) => e.startDate!.isAfter(date));
    return newPlans;
  }

  addPlan(PlanModel plan) async {
    _plans.add(plan);
    calculateProgress();
    notifyListeners();
  }

  editPlan(PlanModel plan) {
    List<PlanModel> newPlan = _plans;
    newPlan.removeWhere((item) => item.id == plan.id);
    newPlan.add(plan);
    _plans = newPlan;
    notifyListeners();
  }

  editStatus(int id, bool status) {
    int index = _plans.indexWhere((e) => e.id == id);
    _plans[index].status = status;
    calculateProgress();
    notifyListeners();
  }

  deletePlan(int id) {
    _plans.removeWhere((item) => item.id == id);
    calculateProgress();
    notifyListeners();
  }

  calculateProgress() {
    int count = _plans.length;
    int checked = _plans.where((element) => element.status == true).length;
    if (checked > 0) {
      _checked = ((checked / count) * 100).toDouble();
      _unChecked = (100 - _checked).toDouble();
    } else {
      _checked = 0;
      _unChecked = 100;
    }
  }
}
