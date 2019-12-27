import 'package:namegenerator/database/list_stream.dart';
import 'package:namegenerator/models/bussiness_name.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  return openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'favourites_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE favourites(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT, isLike INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

Future<void> generateRandomNames() async {
  List<BussinessName> nameList = [];
  for (var i = 0; i < 5; i++) {
    nameList.add(new BussinessName(id: 0, name: "Item: $i", isLiked: false));
  }

  ListStream.addBussinessName(nameList);
}

Future<void> getLikedBussinessNames() async {
  // Get a reference to the database.
  final Database db = await getDatabase();

  // Query the table for all The favourites.
  final List<Map<String, dynamic>> names = await db.query('favourites');

  ListStream.addBussinessName(
      names.map((i) => BussinessName.fromJson(i)).toList());
}

Future<void> insertFavorite(BussinessName name) async {
  final Database db = await getDatabase();

  await db.insert('favourites', name.toMap());
}

Future<void> deleteFavourite(int id) async {
  final Database db = await getDatabase();

  await db.delete(
    'favourites', where: "id = ?",
    // Pass the favourites's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
