// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MenuCategoriesTable extends MenuCategories
    with TableInfo<$MenuCategoriesTable, MenuCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, categoryId, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_categories';
  @override
  VerificationContext validateIntegrity(Insertable<MenuCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
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
  MenuCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $MenuCategoriesTable createAlias(String alias) {
    return $MenuCategoriesTable(attachedDatabase, alias);
  }
}

class MenuCategory extends DataClass implements Insertable<MenuCategory> {
  final int id;
  final int categoryId;
  final String title;
  const MenuCategory(
      {required this.id, required this.categoryId, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['title'] = Variable<String>(title);
    return map;
  }

  MenuCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MenuCategoriesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      title: Value(title),
    );
  }

  factory MenuCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuCategory(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'title': serializer.toJson<String>(title),
    };
  }

  MenuCategory copyWith({int? id, int? categoryId, String? title}) =>
      MenuCategory(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
      );
  MenuCategory copyWithCompanion(MenuCategoriesCompanion data) {
    return MenuCategory(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategory(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuCategory &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.title == this.title);
}

class MenuCategoriesCompanion extends UpdateCompanion<MenuCategory> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> title;
  const MenuCategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.title = const Value.absent(),
  });
  MenuCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String title,
  })  : categoryId = Value(categoryId),
        title = Value(title);
  static Insertable<MenuCategory> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (title != null) 'title': title,
    });
  }

  MenuCategoriesCompanion copyWith(
      {Value<int>? id, Value<int>? categoryId, Value<String>? title}) {
    return MenuCategoriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
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
          ..write('categoryId: $categoryId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES menu_categories (id)'));
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
      'page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pageLimitMeta =
      const VerificationMeta('pageLimit');
  @override
  late final GeneratedColumn<int> pageLimit = GeneratedColumn<int>(
      'page_limit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, title, image, price, category, page, pageLimit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(Insertable<MenuItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('page_limit')) {
      context.handle(_pageLimitMeta,
          pageLimit.isAcceptableOrUnknown(data['page_limit']!, _pageLimitMeta));
    } else if (isInserting) {
      context.missing(_pageLimitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      page: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page'])!,
      pageLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_limit'])!,
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }
}

class MenuItem extends DataClass implements Insertable<MenuItem> {
  final int id;
  final int itemId;
  final String title;
  final String image;
  final double price;
  final int category;
  final int page;
  final int pageLimit;
  const MenuItem(
      {required this.id,
      required this.itemId,
      required this.title,
      required this.image,
      required this.price,
      required this.category,
      required this.page,
      required this.pageLimit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['price'] = Variable<double>(price);
    map['category'] = Variable<int>(category);
    map['page'] = Variable<int>(page);
    map['page_limit'] = Variable<int>(pageLimit);
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      title: Value(title),
      image: Value(image),
      price: Value(price),
      category: Value(category),
      page: Value(page),
      pageLimit: Value(pageLimit),
    );
  }

  factory MenuItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItem(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      price: serializer.fromJson<double>(json['price']),
      category: serializer.fromJson<int>(json['category']),
      page: serializer.fromJson<int>(json['page']),
      pageLimit: serializer.fromJson<int>(json['pageLimit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'price': serializer.toJson<double>(price),
      'category': serializer.toJson<int>(category),
      'page': serializer.toJson<int>(page),
      'pageLimit': serializer.toJson<int>(pageLimit),
    };
  }

  MenuItem copyWith(
          {int? id,
          int? itemId,
          String? title,
          String? image,
          double? price,
          int? category,
          int? page,
          int? pageLimit}) =>
      MenuItem(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        title: title ?? this.title,
        image: image ?? this.image,
        price: price ?? this.price,
        category: category ?? this.category,
        page: page ?? this.page,
        pageLimit: pageLimit ?? this.pageLimit,
      );
  MenuItem copyWithCompanion(MenuItemsCompanion data) {
    return MenuItem(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      price: data.price.present ? data.price.value : this.price,
      category: data.category.present ? data.category.value : this.category,
      page: data.page.present ? data.page.value : this.page,
      pageLimit: data.pageLimit.present ? data.pageLimit.value : this.pageLimit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItem(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('page: $page, ')
          ..write('pageLimit: $pageLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, title, image, price, category, page, pageLimit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItem &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.title == this.title &&
          other.image == this.image &&
          other.price == this.price &&
          other.category == this.category &&
          other.page == this.page &&
          other.pageLimit == this.pageLimit);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItem> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> title;
  final Value<String> image;
  final Value<double> price;
  final Value<int> category;
  final Value<int> page;
  final Value<int> pageLimit;
  const MenuItemsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.price = const Value.absent(),
    this.category = const Value.absent(),
    this.page = const Value.absent(),
    this.pageLimit = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String title,
    required String image,
    required double price,
    required int category,
    required int page,
    required int pageLimit,
  })  : itemId = Value(itemId),
        title = Value(title),
        image = Value(image),
        price = Value(price),
        category = Value(category),
        page = Value(page),
        pageLimit = Value(pageLimit);
  static Insertable<MenuItem> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? title,
    Expression<String>? image,
    Expression<double>? price,
    Expression<int>? category,
    Expression<int>? page,
    Expression<int>? pageLimit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (price != null) 'price': price,
      if (category != null) 'category': category,
      if (page != null) 'page': page,
      if (pageLimit != null) 'page_limit': pageLimit,
    });
  }

  MenuItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<String>? title,
      Value<String>? image,
      Value<double>? price,
      Value<int>? category,
      Value<int>? page,
      Value<int>? pageLimit}) {
    return MenuItemsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      category: category ?? this.category,
      page: page ?? this.page,
      pageLimit: pageLimit ?? this.pageLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (pageLimit.present) {
      map['page_limit'] = Variable<int>(pageLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('page: $page, ')
          ..write('pageLimit: $pageLimit')
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
  required int categoryId,
  required String title,
});
typedef $$MenuCategoriesTableUpdateCompanionBuilder = MenuCategoriesCompanion
    Function({
  Value<int> id,
  Value<int> categoryId,
  Value<String> title,
});

final class $$MenuCategoriesTableReferences
    extends BaseReferences<_$MenuDatabase, $MenuCategoriesTable, MenuCategory> {
  $$MenuCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MenuItemsTable, List<MenuItem>>
      _menuItemsRefsTable(_$MenuDatabase db) =>
          MultiTypedResultKey.fromTable(db.menuItems,
              aliasName: $_aliasNameGenerator(
                  db.menuCategories.id, db.menuItems.category));

  $$MenuItemsTableProcessedTableManager get menuItemsRefs {
    final manager = $$MenuItemsTableTableManager($_db, $_db.menuItems)
        .filter((f) => f.category.id($_item.id));

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

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  Expression<bool> menuItemsRefs(
      Expression<bool> Function($$MenuItemsTableFilterComposer f) f) {
    final $$MenuItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.menuItems,
        getReferencedColumn: (t) => t.category,
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

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> menuItemsRefs<T extends Object>(
      Expression<T> Function($$MenuItemsTableAnnotationComposer a) f) {
    final $$MenuItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.menuItems,
        getReferencedColumn: (t) => t.category,
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
    MenuCategory,
    $$MenuCategoriesTableFilterComposer,
    $$MenuCategoriesTableOrderingComposer,
    $$MenuCategoriesTableAnnotationComposer,
    $$MenuCategoriesTableCreateCompanionBuilder,
    $$MenuCategoriesTableUpdateCompanionBuilder,
    (MenuCategory, $$MenuCategoriesTableReferences),
    MenuCategory,
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
            Value<int> categoryId = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              MenuCategoriesCompanion(
            id: id,
            categoryId: categoryId,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required String title,
          }) =>
              MenuCategoriesCompanion.insert(
            id: id,
            categoryId: categoryId,
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
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
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
    MenuCategory,
    $$MenuCategoriesTableFilterComposer,
    $$MenuCategoriesTableOrderingComposer,
    $$MenuCategoriesTableAnnotationComposer,
    $$MenuCategoriesTableCreateCompanionBuilder,
    $$MenuCategoriesTableUpdateCompanionBuilder,
    (MenuCategory, $$MenuCategoriesTableReferences),
    MenuCategory,
    PrefetchHooks Function({bool menuItemsRefs})>;
typedef $$MenuItemsTableCreateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  required int itemId,
  required String title,
  required String image,
  required double price,
  required int category,
  required int page,
  required int pageLimit,
});
typedef $$MenuItemsTableUpdateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  Value<int> itemId,
  Value<String> title,
  Value<String> image,
  Value<double> price,
  Value<int> category,
  Value<int> page,
  Value<int> pageLimit,
});

final class $$MenuItemsTableReferences
    extends BaseReferences<_$MenuDatabase, $MenuItemsTable, MenuItem> {
  $$MenuItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MenuCategoriesTable _categoryTable(_$MenuDatabase db) =>
      db.menuCategories.createAlias(
          $_aliasNameGenerator(db.menuItems.category, db.menuCategories.id));

  $$MenuCategoriesTableProcessedTableManager? get category {
    if ($_item.category == null) return null;
    final manager = $$MenuCategoriesTableTableManager($_db, $_db.menuCategories)
        .filter((f) => f.id($_item.category!));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
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

  ColumnFilters<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get page => $composableBuilder(
      column: $table.page, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pageLimit => $composableBuilder(
      column: $table.pageLimit, builder: (column) => ColumnFilters(column));

  $$MenuCategoriesTableFilterComposer get category {
    final $$MenuCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
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

  ColumnOrderings<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get page => $composableBuilder(
      column: $table.page, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pageLimit => $composableBuilder(
      column: $table.pageLimit, builder: (column) => ColumnOrderings(column));

  $$MenuCategoriesTableOrderingComposer get category {
    final $$MenuCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
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

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get pageLimit =>
      $composableBuilder(column: $table.pageLimit, builder: (column) => column);

  $$MenuCategoriesTableAnnotationComposer get category {
    final $$MenuCategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
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
    MenuItem,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItem, $$MenuItemsTableReferences),
    MenuItem,
    PrefetchHooks Function({bool category})> {
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
            Value<int> itemId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> category = const Value.absent(),
            Value<int> page = const Value.absent(),
            Value<int> pageLimit = const Value.absent(),
          }) =>
              MenuItemsCompanion(
            id: id,
            itemId: itemId,
            title: title,
            image: image,
            price: price,
            category: category,
            page: page,
            pageLimit: pageLimit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int itemId,
            required String title,
            required String image,
            required double price,
            required int category,
            required int page,
            required int pageLimit,
          }) =>
              MenuItemsCompanion.insert(
            id: id,
            itemId: itemId,
            title: title,
            image: image,
            price: price,
            category: category,
            page: page,
            pageLimit: pageLimit,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MenuItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({category = false}) {
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
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$MenuItemsTableReferences._categoryTable(db),
                    referencedColumn:
                        $$MenuItemsTableReferences._categoryTable(db).id,
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
    MenuItem,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItem, $$MenuItemsTableReferences),
    MenuItem,
    PrefetchHooks Function({bool category})>;

class $MenuDatabaseManager {
  final _$MenuDatabase _db;
  $MenuDatabaseManager(this._db);
  $$MenuCategoriesTableTableManager get menuCategories =>
      $$MenuCategoriesTableTableManager(_db, _db.menuCategories);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
}
