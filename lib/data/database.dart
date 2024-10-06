import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:e_library/model/book.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [Books],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Book>> getAllBook() async {
    return await select(books).get();
  }

  Future<List<Book>> getBookByFavorite(int type) async {
    return await (select(books)..where((tbl) => tbl.favorite.equals(type))).get();
  }

  Future addFavorite(int id, int type) async {
    return (update(books)..where((tbl) => tbl.id.equals(id)))
        .write(BooksCompanion(favorite: Value(type)));
  }

  Future updateBook(int id, String title, String author, DateTime publishedYear, String publisher) async {
    return (update(books)..where((tbl) => tbl.id.equals(id))).write(
      BooksCompanion(
        title: Value(title),
        author: Value(author),
        publishedYear: Value(publishedYear),
        publisher: Value(publisher),
      ),
    );
  }

  Future deleteBook(int id) async {
    return (delete(books)..where((tbl) => tbl.id.equals(id))).go();
  }

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}