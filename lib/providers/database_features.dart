import 'package:evolving_flutter/models/features_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFeatures {

  static Database? _database;

  static final DBFeatures db = DBFeatures._();
  DBFeatures._();

  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = initDB();
    return _database!;

  }

  initDB() async {

    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'featureDB.db');

    return await openDatabase(
      
      path,
      version: 1,
      onCreate: (Database db, int v) async {

        await db.execute(
          
          '''CREATE TABLE Features (
            
            id INTEGER PRIMARY KEY, 
            category TEXT, 
            color TEXT, 
            icon TEXT
            
          )'''
          
        );

      }
      
    );

  }

  addFeature(FeaturesModel feature) async {

    final db = await database;
    final response = db.insert('Features', feature.toJson());
    return response;

  }

  Future<List<FeaturesModel>> getAllFeatures() async {

    final db = await database;
    final response = await db.query('Features'); // In "Json"
    
    List<FeaturesModel> fList = response.isNotEmpty
    ? response.map((e) => FeaturesModel.fromJson(e)).toList()
    : [];

    return fList;

  }

}

