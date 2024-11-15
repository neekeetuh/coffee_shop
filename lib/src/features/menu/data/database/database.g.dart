// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MenuCategoriesTable extends MenuCategories
    with TableInfo<$MenuCategoriesTable, MenuCategoryDataClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<MenuCategoryDataClass> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuCategoryDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuCategoryDataClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $MenuCategoriesTable createAlias(String alias) {
    return $MenuCategoriesTable(attachedDatabase, alias);
  }
}

class MenuCategoryDataClass extends DataClass
    implements Insertable<MenuCategoryDataClass> {
  final int id;
  final String title;
  const MenuCategoryDataClass({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  MenuCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MenuCategoriesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory MenuCategoryDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuCategoryDataClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  MenuCategoryDataClass copyWith({int? id, String? title}) =>
      MenuCategoryDataClass(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  MenuCategoryDataClass copyWithCompanion(MenuCategoriesCompanion data) {
    return MenuCategoryDataClass(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategoryDataClass(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuCategoryDataClass &&
          other.id == this.id &&
          other.title == this.title);
}

class MenuCategoriesCompanion extends UpdateCompanion<MenuCategoryDataClass> {
  final Value<int> id;
  final Value<String> title;
  const MenuCategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  MenuCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<MenuCategoryDataClass> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  MenuCategoriesCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return MenuCategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItemDataClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumnWithTypeConverter<PriceDto, String> price =
      GeneratedColumn<String>('price', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PriceDto>($MenuItemsTable.$converterprice);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES menu_categories (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, image, price, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(Insertable<MenuItemDataClass> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    context.handle(_priceMeta, const VerificationResult.success());
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuItemDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItemDataClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      price: $MenuItemsTable.$converterprice.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PriceDto, String, String> $converterprice =
      PriceDto.converter;
}

class MenuItemDataClass extends DataClass
    implements Insertable<MenuItemDataClass> {
  final int id;
  final String title;
  final String description;
  final String image;
  final PriceDto price;
  final int categoryId;
  const MenuItemDataClass(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    {
      map['price'] =
          Variable<String>($MenuItemsTable.$converterprice.toSql(price));
    }
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      image: Value(image),
      price: Value(price),
      categoryId: Value(categoryId),
    );
  }

  factory MenuItemDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItemDataClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      price: $MenuItemsTable.$converterprice
          .fromJson(serializer.fromJson<String>(json['price'])),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'price': serializer
          .toJson<String>($MenuItemsTable.$converterprice.toJson(price)),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  MenuItemDataClass copyWith(
          {int? id,
          String? title,
          String? description,
          String? image,
          PriceDto? price,
          int? categoryId}) =>
      MenuItemDataClass(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        price: price ?? this.price,
        categoryId: categoryId ?? this.categoryId,
      );
  MenuItemDataClass copyWithCompanion(MenuItemsCompanion data) {
    return MenuItemDataClass(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      price: data.price.present ? data.price.value : this.price,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemDataClass(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, image, price, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItemDataClass &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.price == this.price &&
          other.categoryId == this.categoryId);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItemDataClass> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> image;
  final Value<PriceDto> price;
  final Value<int> categoryId;
  const MenuItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.price = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String image,
    required PriceDto price,
    required int categoryId,
  })  : title = Value(title),
        description = Value(description),
        image = Value(image),
        price = Value(price),
        categoryId = Value(categoryId);
  static Insertable<MenuItemDataClass> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? price,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (price != null) 'price': price,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  MenuItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? image,
      Value<PriceDto>? price,
      Value<int>? categoryId}) {
    return MenuItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (price.present) {
      map['price'] =
          Variable<String>($MenuItemsTable.$converterprice.toSql(price.value));
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MenuDatabase extends GeneratedDatabase {
  _$MenuDatabase(QueryExecutor e) : super(e);
  $MenuDatabaseManager get managers => $MenuDatabaseManager(this);
  late final $MenuCategoriesTable menuCategories = $MenuCategoriesTable(this);
  late final $MenuItemsTable menuItems = $MenuItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [menuCategories, menuItems];
}

typedef $$MenuCategoriesTableCreateCompanionBuilder = MenuCategoriesCompanion
    Function({
  Value<int> id,
  required String title,
});
typedef $$MenuCategoriesTableUpdateCompanionBuilder = MenuCategoriesCompanion
    Function({
  Value<int> id,
  Value<String> title,
});

final class $$MenuCategoriesTableReferences extends BaseReferences<
    _$MenuDatabase, $MenuCategoriesTable, MenuCategoryDataClass> {
  $$MenuCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MenuItemsTable, List<MenuItemDataClass>>
      _menuItemsRefsTable(_$MenuDatabase db) =>
          MultiTypedResultKey.fromTable(db.menuItems,
              aliasName: $_aliasNameGenerator(
                  db.menuCategories.id, db.menuItems.categoryId));

  $$MenuItemsTableProcessedTableManager get menuItemsRefs {
    final manager = $$MenuItemsTableTableManager($_db, $_db.menuItems)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_menuItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MenuCategoriesTableFilterComposer
    extends Composer<_$MenuDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  Expression<bool> menuItemsRefs(
      Expression<bool> Function($$MenuItemsTableFilterComposer f) f) {
    final $$MenuItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.menuItems,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MenuItemsTableFilterComposer(
              $db: $db,
              $table: $db.menuItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MenuCategoriesTableOrderingComposer
    extends Composer<_$MenuDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$MenuCategoriesTableAnnotationComposer
    extends Composer<_$MenuDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> menuItemsRefs<T extends Object>(
      Expression<T> Function($$MenuItemsTableAnnotationComposer a) f) {
    final $$MenuItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.menuItems,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MenuItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.menuItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MenuCategoriesTableTableManager extends RootTableManager<
    _$MenuDatabase,
    $MenuCategoriesTable,
    MenuCategoryDataClass,
    $$MenuCategoriesTableFilterComposer,
    $$MenuCategoriesTableOrderingComposer,
    $$MenuCategoriesTableAnnotationComposer,
    $$MenuCategoriesTableCreateCompanionBuilder,
    $$MenuCategoriesTableUpdateCompanionBuilder,
    (MenuCategoryDataClass, $$MenuCategoriesTableReferences),
    MenuCategoryDataClass,
    PrefetchHooks Function({bool menuItemsRefs})> {
  $$MenuCategoriesTableTableManager(
      _$MenuDatabase db, $MenuCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              MenuCategoriesCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
          }) =>
              MenuCategoriesCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MenuCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({menuItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (menuItemsRefs) db.menuItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (menuItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MenuCategoriesTableReferences
                            ._menuItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MenuCategoriesTableReferences(db, table, p0)
                                .menuItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MenuCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$MenuDatabase,
    $MenuCategoriesTable,
    MenuCategoryDataClass,
    $$MenuCategoriesTableFilterComposer,
    $$MenuCategoriesTableOrderingComposer,
    $$MenuCategoriesTableAnnotationComposer,
    $$MenuCategoriesTableCreateCompanionBuilder,
    $$MenuCategoriesTableUpdateCompanionBuilder,
    (MenuCategoryDataClass, $$MenuCategoriesTableReferences),
    MenuCategoryDataClass,
    PrefetchHooks Function({bool menuItemsRefs})>;
typedef $$MenuItemsTableCreateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required String image,
  required PriceDto price,
  required int categoryId,
});
typedef $$MenuItemsTableUpdateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> image,
  Value<PriceDto> price,
  Value<int> categoryId,
});

final class $$MenuItemsTableReferences
    extends BaseReferences<_$MenuDatabase, $MenuItemsTable, MenuItemDataClass> {
  $$MenuItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MenuCategoriesTable _categoryIdTable(_$MenuDatabase db) =>
      db.menuCategories.createAlias(
          $_aliasNameGenerator(db.menuItems.categoryId, db.menuCategories.id));

  $$MenuCategoriesTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager = $$MenuCategoriesTableTableManager($_db, $_db.menuCategories)
        .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MenuItemsTableFilterComposer
    extends Composer<_$MenuDatabase, $MenuItemsTable> {
  $$MenuItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PriceDto, PriceDto, String> get price =>
      $composableBuilder(
          column: $table.price,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$MenuCategoriesTableFilterComposer get categoryId {
    final $$MenuCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.menuCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MenuCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.menuCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MenuItemsTableOrderingComposer
    extends Composer<_$MenuDatabase, $MenuItemsTable> {
  $$MenuItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  $$MenuCategoriesTableOrderingComposer get categoryId {
    final $$MenuCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.menuCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MenuCategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.menuCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MenuItemsTableAnnotationComposer
    extends Composer<_$MenuDatabase, $MenuItemsTable> {
  $$MenuItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PriceDto, String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$MenuCategoriesTableAnnotationComposer get categoryId {
    final $$MenuCategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.menuCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MenuCategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.menuCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MenuItemsTableTableManager extends RootTableManager<
    _$MenuDatabase,
    $MenuItemsTable,
    MenuItemDataClass,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItemDataClass, $$MenuItemsTableReferences),
    MenuItemDataClass,
    PrefetchHooks Function({bool categoryId})> {
  $$MenuItemsTableTableManager(_$MenuDatabase db, $MenuItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<PriceDto> price = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
          }) =>
              MenuItemsCompanion(
            id: id,
            title: title,
            description: description,
            image: image,
            price: price,
            categoryId: categoryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required String image,
            required PriceDto price,
            required int categoryId,
          }) =>
              MenuItemsCompanion.insert(
            id: id,
            title: title,
            description: description,
            image: image,
            price: price,
            categoryId: categoryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MenuItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$MenuItemsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$MenuItemsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MenuItemsTableProcessedTableManager = ProcessedTableManager<
    _$MenuDatabase,
    $MenuItemsTable,
    MenuItemDataClass,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItemDataClass, $$MenuItemsTableReferences),
    MenuItemDataClass,
    PrefetchHooks Function({bool categoryId})>;

class $MenuDatabaseManager {
  final _$MenuDatabase _db;
  $MenuDatabaseManager(this._db);
  $$MenuCategoriesTableTableManager get menuCategories =>
      $$MenuCategoriesTableTableManager(_db, _db.menuCategories);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
}
