import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper
{
  static final _dbName = '_mydatabase.db';
  static final _dbVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async{
    if(_database!= null) return database;
    _database = await _initiateDatabase();
    return _database;
  }
  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }
  Future _onCreate(Database db, int version){
    db.execute(
      '''
      
      '''
    );
  }
}