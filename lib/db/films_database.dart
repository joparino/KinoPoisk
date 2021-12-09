import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FilmDatabase
{
  static final FilmDatabase instance = FilmDatabase._init();

  static Database? _database;

  FilmDatabase._init();

  Future <Database> get database async
  {
    if(_database != null) return _database!;

    _database = await _initDB('films.db');
    return _database!;
  }

  Future <Database> _initDB(String filePath) async
  {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1);
  }


  Future close() async
  {
    final db = await instance.database;
    db.close();
  }
}