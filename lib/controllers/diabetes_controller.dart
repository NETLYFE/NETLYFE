import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:netlyfe/models/diabetes.dart';

import '../database/db_helper.dart';

class DiabetesController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var diabList = <Diabetes>[].obs;

  Future<int> addSugar({Diabetes? diab}) async {
    return await DBHelper.insertSugar(diab);
  }

  void getAllSugar() async {
    List<Map<String, dynamic>> diab = await DBHelper.querySugarLevels();
    diabList.assignAll(diab.map((e) => Diabetes.fromJson(e)).toList());
  }

  void delete(Diabetes diab) {
    DBHelper.deleteSugarLevel(diab);
  }

  
}
