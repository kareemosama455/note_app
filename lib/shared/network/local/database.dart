import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class SqlDB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'todo.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1,
         onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    await db.execute("ALTER TABLE notes ADD COLUMN description TEXT").then((onValue) {
      print('database upgraded ====');
    });
  }

  _onCreate(Database db, int version) async{
    print('database created');
    Batch batch = db.batch();
     batch.execute('''
      CREATE TABLE notes(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,title Text,date TEXT,time TEXT,status TEXT )
      ''');
    await batch.commit();
  }

  readData(sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteDataBase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'todo.db');
    await deleteDatabase(path).then((onValue) {
      print('database deleted');
    });
  }
}




// void createDatabase() async {
//   var database = await openDatabase('todo.db', version: 1,
//       onCreate: (database, vesion) async {
//     if (kDebugMode) {
//       print('Database Created');
//       database
//           .execute(
//               'CREATE TABLE Tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status Text)')
//           .then((value) {
//         if (kDebugMode) {
//           print('Table Created');
//         }
//       }).catchError((error) {
//         if (kDebugMode) {
//           print('Error Creating Table${error.toString()}');
//         }
//       });
//     }
//   }, onOpen: (database) {
//     if (kDebugMode) {
//       print('Database opened');
//     }
//   });
// }
