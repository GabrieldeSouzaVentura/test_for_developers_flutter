import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), 'good_burgerdb.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db);
        await _seedData(db);
      },
    );

    return _db!;
  }

  static Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS items (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price REAL,
        itemType INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY,
        total REAL
      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS order_items (
        id INTEGER PRIMARY KEY,
        itemId INTERGER,
        orderId INTEGER
      );
    ''');
  }

  static Future<void> _seedData(Database db) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM items'),
    );

    if (count == 0) {
      final items = [
        {'id': 1, 'name': 'X Burger', 'price': 5.0, 'itemType': 1},
        {'id': 2, 'name': 'X Egg', 'price': 4.5, 'itemType': 1},
        {'id': 3, 'name': 'X Bacon', 'price': 7.0, 'itemType': 1},
        {'id': 4, 'name': 'Fries', 'price': 2.0, 'itemType': 2},
        {'id': 5, 'name': 'Soft drink', 'price': 2.5, 'itemType': 3},
      ];

      for (var item in items) {
        await db.insert('items', item);
      }
    }
  }
}
