import 'package:logger/logger.dart';
import 'package:netlyfe/models/doserem_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? database;
  static const int db_version = 1;
  static const String doseTable = "dosereminder";

  static Future<void> initDB() async {
    var log = Logger();
    if (database != null) return;
    try {
      String dbPath = await getDatabasesPath() + "netlyfe.db";
      database = await openDatabase(dbPath, version: db_version,
          onCreate: (_db, version) {
        print("Netlyfe Local DB Created");

        return _db.execute(
          "CREATE TABLE $doseTable("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name STRING, notes TEXT, startTime STRING, "
          "numofDose INTEGER, timesDaily INTEGER, "
          "color INTEGER, program STRING, "
          "repeat STRING)",
        );
      });
    } catch (e) {
      log.d(e);
    }
  }

  static Future<int> insert(DoseReminder? dose) async {
    print("Dose Added: ");
    return await database?.insert(doseTable, dose!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> queryDose() async {
    print("DoseQuery triggered");
    return await database!.query(doseTable);
  }
}
// numofDose STRING, timesDaily STRING,