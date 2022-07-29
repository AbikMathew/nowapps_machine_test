import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> openDB() async {
  
// Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'nowapps_cart.db');

  openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) {
      
    },
  );
}
