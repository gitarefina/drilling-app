import 'package:sqflite/sqflite.dart';

import 'drilling_model.dart';

Future<void> createDatabase(Database db, int version) async {
  await db.execute('''
    CREATE TABLE ${DrillingFields.tableName} (
      ${DrillingFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DrillingFields.holeId} TEXT NOT NULL,
      ${DrillingFields.accelerometer} TEXT,
      ${DrillingFields.gyroscope} TEXT,
      ${DrillingFields.picture} TEXT,
      ${DrillingFields.createdTime} TEXT NOT NULL,
      ${DrillingFields.statusProgress} TEXT NOT NULL,
      ${DrillingFields.statusWorkflow} TEXT NOT NULL
    )
  ''');
}


