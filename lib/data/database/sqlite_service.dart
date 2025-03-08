import 'package:sqflite/sqflite.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';

class SqliteService {
  static final SqliteService _instance = SqliteService._internal();
  static Database? _database;

  factory SqliteService() => _instance;

  SqliteService._internal();

  static const String _databaseName = 'restaurant.db';
  static const String _tableName = 'favorite';
  static const int _version = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDb();
    return _database!;
  }

  Future<void> createTables(Database database) async {
    await database.execute(
      """CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        location TEXT,
        imageUrl TEXT,
        rating REAL
      )
      """,
    );
  }

  Future<Database> _initializeDb() async {
    return await openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<void> insertFavorite(Map<String, dynamic> restaurant) async {
    final db = await database;

    await db.insert(_tableName, restaurant,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Restaurant?> getItemById(String id) async {
    final db = await database;
    final results =
        await db.query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);

    if (results.isEmpty) return null;
    return Restaurant.fromJson(results.first);
  }

  Future<int> updateItem(String id, Restaurant resto) async {
    final db = await database;
    final data = resto.toJson();
    return await db.update(_tableName, data, where: "id = ?", whereArgs: [id]);
  }

  Future<int> removeItem(String id) async {
    final db = await database;
    return await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Restaurant>> getFavorites() async {
    final db = await database;
    final results = await db.query(_tableName);

    if (results.isEmpty) return List.empty();

    return results.map((result) => Restaurant.fromJson(result)).toList();
  }
}
