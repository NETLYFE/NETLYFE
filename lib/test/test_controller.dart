import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/test/drug_text.dart';

abstract class DrugTestFunctions {
  Future<bool> addDrugTest({DrugTest? test});
  Stream<List<DrugTest>> getDrugTests();
}

class DrugTestController implements DrugTestFunctions {
  var log = Logger();
  final drugsTestCollection = FirebaseFirestore.instance.collection('Test');
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  @override
  Future<bool> addDrugTest({DrugTest? test}) async {
    final testcol = drugsTestCollection.doc();
    test!.testid = testcol.id;
    await testcol.set(test.toJson());
    return true;
  }

  @override
  Stream<List<DrugTest>> getDrugTests() {
    final querySnapshot =
        FirebaseFirestore.instance.collection('Test').snapshots();
    return querySnapshot.map((snapshots) =>
        snapshots.docs.map((doc) => DrugTest.fromJson(doc.data())).toList());
  }
}
