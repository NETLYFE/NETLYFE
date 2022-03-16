import 'package:logger/logger.dart';
import 'package:netlyfe/models/diabetes.dart';
import 'package:netlyfe/models/doserem_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._(); //Singleton Class
  static Database? _database;
  static const int db_version = 1;
  static const String doseTable = "dosereminder";
  static const String diabTable = "diabetes";

  static Future<void> initDB() async {
    var log = Logger();
    if (_database != null) return;
    try {
      String dbPath = await getDatabasesPath() + "netlyfe.db";
      _database = await openDatabase(dbPath, version: db_version);
      await _database!.transaction((txn) async {
        await txn.execute("CREATE TABLE IF NOT EXISTS $doseTable("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "name STRING, notes TEXT, startTime STRING, "
            "numofDose INTEGER, timesDaily INTEGER, "
            "color INTEGER, program STRING, "
            "repeat STRING)");

        await txn.execute("CREATE TABLE IF NOT EXISTS $diabTable("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "testType STRING, testValue STRING, "
            "testTime STRING, testDate STRING, color INTEGER)");
      });
    } catch (e) {
      log.d(e);
    }
  }

//DOSE REMINDER FUNCTIONS
  static Future<int> insert(DoseReminder? dose) async {
    return await _database?.insert(doseTable, dose!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> queryDose() async {
    return await _database!.query(doseTable);
  }

  static delete(DoseReminder dose) async {
    return await _database!
        .delete(doseTable, where: 'id=?', whereArgs: [dose.id]);
  }

//DIABETES FUNCTIONS
  static Future<int> insertSugar(Diabetes? diabetes) async {
    return await _database?.insert(diabTable, diabetes!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> querySugarLevels() async {
    return await _database!.query(diabTable);
  }

  static deleteSugarLevel(Diabetes diab) async {
    return await _database!
        .delete(diabTable, where: 'id=?', whereArgs: [diab.id]);
  }
}
