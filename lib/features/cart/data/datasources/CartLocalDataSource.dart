import 'package:coffee_lake_app/features/product/data/models/CartProductData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartLocalDataSource {
  static const dbName = 'CoffeeLakeCartDB.db';
  static const table1 = 'cart_items';

  late Database db;

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, dbName);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $table1 (
            id INTEGER NOT NULL,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            sale INTEGER NOT NULL,
            vol REAL NOT NULL,
            count INTEGER NOT NULL,
            PRIMARY KEY (id, vol)
          )
        ''');
      },
    );
  }

  Future<List<CartProductData>> getCart() async {
    List<Map<String, Object?>> rows = await db.rawQuery(
      'select * from $table1',
    );

    return rows
        .map(
          (row) => CartProductData(
            id: row['id'] as int,
            name: row['name'] as String,
            price: row['price'] as double,
            sale: row['sale'] as int,
            vol: row['vol'] as double,
            count: row['count'] as int,
          ),
        )
        .toList();
  }

  Future<CartProductData?> getProduct(int productId, double productVol) async {
    List<Map<String, Object?>> rows = await db.rawQuery(
      'select * from $table1 where id = ? and vol = ?',
      [productId, productVol]
    );

    if(rows.isEmpty) return null;

    return rows
        .map(
          (row) => CartProductData(
            id: row['id'] as int,
            name: row['name'] as String,
            price: row['price'] as double,
            sale: row['sale'] as int,
            vol: row['vol'] as double,
            count: row['count'] as int,
          ),
        ).first;
  }

  Future<void> addToCart(CartProductData product) async {
    List<Map<String, Object?>> query = await db.rawQuery(
      'select count from $table1 where id = ? and vol = ?',
      [product.id, product.vol],
    );
    if (query.isNotEmpty) {
      final currentCount = query.first['count'] as int;
      await db.rawUpdate(
        'update $table1 set count = ? where id = ? and vol = ?',
        [currentCount+1, product.id, product.vol],
      );
    } else {
      await db.rawInsert(
        'insert into $table1(id, name, price, sale, vol, count) values (?, ?, ?, ?, ?, ?)',
        [
          product.id,
          product.name,
          product.price,
          product.sale,
          product.vol,
          product.count,
        ],
      );
    }
  }

  Future<void> removeFromCart(CartProductData product) async {
    List<Map<String, Object?>> query = await db.rawQuery(
      'select count from $table1 where id = ? and vol = ?',
      [product.id, product.vol],
    );
    if(query.isEmpty) return;
    final currentCount = query.first['count'] as int;
    if (currentCount > 1) {
      await db.rawUpdate(
        'update $table1 set count = ? where id = ? and vol = ?',
        [currentCount-1, product.id, product.vol],
      );
    } else {
      await db.rawDelete(
          'delete from $table1 where id = ? and vol = ?',
          [product.id, product.vol]);
    }
  }

  Future<void> clearAll() async {
    await db.rawDelete('delete from $table1');
  }
}
