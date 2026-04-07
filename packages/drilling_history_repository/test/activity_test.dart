import 'package:activity/repository/drilling_history_datasource_impl.dart';
import 'package:core/database/db.dart';
import 'package:core/database/drilling_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late DrillingHistoryDatasourceImpl datasource;
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await createDatabase(db, 1);
    datasource = DrillingHistoryDatasourceImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('createDatabase should create table', () async {
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='${DrillingFields.tableName}'",
    );

    expect(result.isNotEmpty, true);
  });

  test('getHistoryDrilling should return inserted data', () async {
    // Insert test data
    await db.insert(DrillingFields.tableName, {
      DrillingFields.holeId: 'H001',
      DrillingFields.accelerometer: 'acc1',
      DrillingFields.gyroscope: 'gyro1',
      DrillingFields.picture: 'img.png',
      DrillingFields.createdTime: DateTime.now().toIso8601String(),
      DrillingFields.statusProgress: 'ongoing',
      DrillingFields.statusWorkflow: 'started',
    });

    final result = await datasource.getHistoryDrilling();

    expect(result.length, 1);
    expect(result.first.hole_id, 'H001');
  });

  test('getHistoryDrilling should return data ordered by createdTime DESC', () async {
    await db.insert(DrillingFields.tableName, {
      DrillingFields.holeId: 'OLD',
      DrillingFields.createdTime: '2020-01-01T00:00:00',
      DrillingFields.statusProgress: 'done',
      DrillingFields.statusWorkflow: 'end',
    });

    await db.insert(DrillingFields.tableName, {
      DrillingFields.holeId: 'NEW',
      DrillingFields.createdTime: '2025-01-01T00:00:00',
      DrillingFields.statusProgress: 'done',
      DrillingFields.statusWorkflow: 'end',
    });

    final result = await datasource.getHistoryDrilling();

    expect(result.first.hole_id, 'NEW'); // newest first
  });

}
