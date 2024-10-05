// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<int> favorite = GeneratedColumn<int>(
      'favorite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _publishedYearMeta =
      const VerificationMeta('publishedYear');
  @override
  late final GeneratedColumn<DateTime> publishedYear =
      GeneratedColumn<DateTime>('published_year', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, author, publisher, favorite, createdAt, publishedYear];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    } else if (isInserting) {
      context.missing(_publisherMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('published_year')) {
      context.handle(
          _publishedYearMeta,
          publishedYear.isAcceptableOrUnknown(
              data['published_year']!, _publishedYearMeta));
    } else if (isInserting) {
      context.missing(_publishedYearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favorite'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      publishedYear: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}published_year'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String author;
  final String publisher;
  final int favorite;
  final DateTime createdAt;
  final DateTime publishedYear;
  const Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.publisher,
      required this.favorite,
      required this.createdAt,
      required this.publishedYear});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['publisher'] = Variable<String>(publisher);
    map['favorite'] = Variable<int>(favorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['published_year'] = Variable<DateTime>(publishedYear);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      author: Value(author),
      publisher: Value(publisher),
      favorite: Value(favorite),
      createdAt: Value(createdAt),
      publishedYear: Value(publishedYear),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      publisher: serializer.fromJson<String>(json['publisher']),
      favorite: serializer.fromJson<int>(json['favorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      publishedYear: serializer.fromJson<DateTime>(json['publishedYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'publisher': serializer.toJson<String>(publisher),
      'favorite': serializer.toJson<int>(favorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'publishedYear': serializer.toJson<DateTime>(publishedYear),
    };
  }

  Book copyWith(
          {int? id,
          String? title,
          String? author,
          String? publisher,
          int? favorite,
          DateTime? createdAt,
          DateTime? publishedYear}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        publisher: publisher ?? this.publisher,
        favorite: favorite ?? this.favorite,
        createdAt: createdAt ?? this.createdAt,
        publishedYear: publishedYear ?? this.publishedYear,
      );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      author: data.author.present ? data.author.value : this.author,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      publishedYear: data.publishedYear.present
          ? data.publishedYear.value
          : this.publishedYear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('publishedYear: $publishedYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, author, publisher, favorite, createdAt, publishedYear);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.publisher == this.publisher &&
          other.favorite == this.favorite &&
          other.createdAt == this.createdAt &&
          other.publishedYear == this.publishedYear);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> author;
  final Value<String> publisher;
  final Value<int> favorite;
  final Value<DateTime> createdAt;
  final Value<DateTime> publishedYear;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.publisher = const Value.absent(),
    this.favorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.publishedYear = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String author,
    required String publisher,
    required int favorite,
    required DateTime createdAt,
    required DateTime publishedYear,
  })  : title = Value(title),
        author = Value(author),
        publisher = Value(publisher),
        favorite = Value(favorite),
        createdAt = Value(createdAt),
        publishedYear = Value(publishedYear);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? author,
    Expression<String>? publisher,
    Expression<int>? favorite,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? publishedYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (publisher != null) 'publisher': publisher,
      if (favorite != null) 'favorite': favorite,
      if (createdAt != null) 'created_at': createdAt,
      if (publishedYear != null) 'published_year': publishedYear,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? author,
      Value<String>? publisher,
      Value<int>? favorite,
      Value<DateTime>? createdAt,
      Value<DateTime>? publishedYear}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      publisher: publisher ?? this.publisher,
      favorite: favorite ?? this.favorite,
      createdAt: createdAt ?? this.createdAt,
      publishedYear: publishedYear ?? this.publishedYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<int>(favorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (publishedYear.present) {
      map['published_year'] = Variable<DateTime>(publishedYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('publishedYear: $publishedYear')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $BooksTable books = $BooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}

typedef $$BooksTableCreateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  required String title,
  required String author,
  required String publisher,
  required int favorite,
  required DateTime createdAt,
  required DateTime publishedYear,
});
typedef $$BooksTableUpdateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> author,
  Value<String> publisher,
  Value<int> favorite,
  Value<DateTime> createdAt,
  Value<DateTime> publishedYear,
});

class $$BooksTableFilterComposer extends FilterComposer<_$AppDb, $BooksTable> {
  $$BooksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get publisher => $state.composableBuilder(
      column: $state.table.publisher,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get publishedYear => $state.composableBuilder(
      column: $state.table.publishedYear,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BooksTableOrderingComposer
    extends OrderingComposer<_$AppDb, $BooksTable> {
  $$BooksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get publisher => $state.composableBuilder(
      column: $state.table.publisher,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get publishedYear => $state.composableBuilder(
      column: $state.table.publishedYear,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BooksTableTableManager extends RootTableManager<
    _$AppDb,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDb, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()> {
  $$BooksTableTableManager(_$AppDb db, $BooksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BooksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BooksTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<String> publisher = const Value.absent(),
            Value<int> favorite = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> publishedYear = const Value.absent(),
          }) =>
              BooksCompanion(
            id: id,
            title: title,
            author: author,
            publisher: publisher,
            favorite: favorite,
            createdAt: createdAt,
            publishedYear: publishedYear,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String author,
            required String publisher,
            required int favorite,
            required DateTime createdAt,
            required DateTime publishedYear,
          }) =>
              BooksCompanion.insert(
            id: id,
            title: title,
            author: author,
            publisher: publisher,
            favorite: favorite,
            createdAt: createdAt,
            publishedYear: publishedYear,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BooksTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDb, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
}
