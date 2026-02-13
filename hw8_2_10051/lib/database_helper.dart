import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'appDBbmi2.db');

    return await openDatabase(
      path,
      version: 5,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tbUser(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT,
        pwd TEXT,
        weight REAL,
        height REAL,
        bmi REAL,
        bmiType TEXT,
        targetWeight REAL
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 5) {
      await db.execute('ALTER TABLE tbUser ADD COLUMN targetWeight REAL');
    }
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.db;
    return await db.insert('tbUser', user.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await instance.db;
    return await db.query('tbUser');
  }

  Future<int> updateUser(User user) async {
    Database db = await instance.db;
    return await db.update(
      'tbUser',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.db;
    return await db.delete('tbUser', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllUsers() async {
    Database db = await instance.db;
    await db.delete('tbUser');
  }

  Future<void> initializeUsers() async {}

  Future<void> updateAllBmi() async {}
}
