import 'package:drift/drift.dart';

@DataClassName('Book')
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 128)();
  TextColumn get author => text().withLength(max: 128)();
  TextColumn get publisher => text().withLength(max: 128)();
  IntColumn get favorite  => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get publishedYear => dateTime()();
}