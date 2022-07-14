import 'package:flutter/material.dart';
import 'package:productive/model/plan_model.dart';

class PlanProvider with ChangeNotifier {
  List<PlanModel> _plans = [];

  List<PlanModel> get plans => _plans;

  set wishlist(List<PlanModel> plans) {
    _plans = plans;
    notifyListeners();
  }

  addPlan(PlanModel plan) {
    _plans.add(plan);
    notifyListeners();
  }

  editPlan(PlanModel plan) {
    List<PlanModel> newPlan = _plans;
    newPlan.removeWhere((item) => item.id == plan.id);
    newPlan.add(plan);
    _plans = newPlan;
    notifyListeners();
  }

  deletePlan(int id) {
    _plans.removeAt(id);
    notifyListeners();
  }
}
