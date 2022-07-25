import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final dbPath = await sql.getDatabasesPath();
    sql.openDatabase(path.join(dbPath, "places.db"),
        onCreate: ((db, version) {}), version: 1);
  }
}
