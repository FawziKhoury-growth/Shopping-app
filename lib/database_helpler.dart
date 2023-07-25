import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task4/Product.dart';
import 'package:uuid/uuid.dart';

class DatabaseHelper {
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  // DatabaseHelper._privateConstructor();

  static initDatabase() async {
    _database = await fawziFunction();
  }

  // static Future get database async {
  //   // if (_database != null) return _database;

  //   _database = await fawziFunction();
  //   // return _database;
  // }

  static Future<Database> fawziFunction() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE productInfo (id TEXT PRIMARY KEY, name TEXT, description TEXT, Price REAL, AvailableQuantity INTEGER, imageUrl TEXT)');

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 1',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 2',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 3',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 4',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 5',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 6',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 7',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 8',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 9',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        DatabaseHelper.insertProduct(
            db,
            Product(
                id: Uuid().v1(),
                name: 'product 10',
                description: 'this is a product 1',
                price: 2.5,
                availableQuantity: 5,
                imageUrl:
                    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2021_07/3451045/210218-product-of-the-year-2x1-cs.jpg'));

        print("data inserted");
      },
    );
  }

  // static Future<void> insertData(String id, String name, String description, double price, int AvailableQuantity, String imageUrl) async {

  //   await _database!.rawInsert('INSERT INTO productInfo(id, name, description, Price, AvailableQuantity, imageUrl) VALUES(?, ?, ?, ?)',
  //   [id, name, description, price, AvailableQuantity, imageUrl]);
  //}
  static Future<void> insertProduct(Database db, Product product) async {
    await db.insert('productInfo', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateProduct(Product product) async {
    await _database?.update('productInfo',
        {'AvailableQuantity': product.availableQuantity - product.quantity},
        where: 'id = ?', whereArgs: [product.id]);
  }

  static Future<void> deleteUserInfo(String id) async {
    await _database?.delete('productInfo', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Product>> getProducts() async {
    List<Map<String, dynamic>> maps = await _database!.query('productInfo');

    // Convert the list of maps to a list of UserInfo objects
    return List.generate(maps.length, (index) {
      return Product.fromMap(maps[index]);
    });
  }
}
