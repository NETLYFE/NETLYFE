import 'package:get/state_manager.dart';
import 'package:netlyfe/database/db_helper.dart';
import 'package:netlyfe/models/doserem_model.dart';

class DoseController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var doseList = <DoseReminder>[].obs;

  Future<int> addDose({DoseReminder? dose}) async {
    return await DBHelper.insert(dose);
  }

  void getAllDose() async {
    List<Map<String, dynamic>> doses = await DBHelper.queryDose();
    doseList
        .assignAll(doses.map((data) => DoseReminder.fromJson(data)).toList());
  }
}
