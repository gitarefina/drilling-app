import 'package:core/database/db.dart';
import 'package:sqflite/sqflite.dart';

class DrillingDb {
  static final DrillingDb instance = DrillingDb._internal();
  
  static Database? _database;

  DrillingDb._internal();

  Future<Database> get database async{
    if(_database !=null){
       return _database!;

    }
    _database = await initDatabase();
    return _database!;
  }



Future<Database> initDatabase() async{
  final databasePath = await getDatabasesPath();

  final path = '$databasePath/drilling.db';
  return await openDatabase(path,
  version: 1,
  onCreate: createDatabase);

}

}