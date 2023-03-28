// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Option extends DataClass implements Insertable<Option> {
  final int id;
  final int additionsId;
  final String name;
  final double price;
  final int quantity;
  Option(
      {required this.id,
      required this.additionsId,
      required this.name,
      required this.price,
      required this.quantity});
  factory Option.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Option(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}option_id'])!,
      additionsId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additions_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['option_id'] = Variable<int>(id);
    map['additions_id'] = Variable<int>(additionsId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  OptionsCompanion toCompanion(bool nullToAbsent) {
    return OptionsCompanion(
      id: Value(id),
      additionsId: Value(additionsId),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
    );
  }

  factory Option.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Option(
      id: serializer.fromJson<int>(json['id']),
      additionsId: serializer.fromJson<int>(json['additionsId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'additionsId': serializer.toJson<int>(additionsId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  Option copyWith(
          {int? id,
          int? additionsId,
          String? name,
          double? price,
          int? quantity}) =>
      Option(
        id: id ?? this.id,
        additionsId: additionsId ?? this.additionsId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('Option(')
          ..write('id: $id, ')
          ..write('additionsId: $additionsId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, additionsId, name, price, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Option &&
          other.id == this.id &&
          other.additionsId == this.additionsId &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity);
}

class OptionsCompanion extends UpdateCompanion<Option> {
  final Value<int> id;
  final Value<int> additionsId;
  final Value<String> name;
  final Value<double> price;
  final Value<int> quantity;
  const OptionsCompanion({
    this.id = const Value.absent(),
    this.additionsId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  OptionsCompanion.insert({
    this.id = const Value.absent(),
    required int additionsId,
    required String name,
    required double price,
    this.quantity = const Value.absent(),
  })  : additionsId = Value(additionsId),
        name = Value(name),
        price = Value(price);
  static Insertable<Option> custom({
    Expression<int>? id,
    Expression<int>? additionsId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'option_id': id,
      if (additionsId != null) 'additions_id': additionsId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
    });
  }

  OptionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? additionsId,
      Value<String>? name,
      Value<double>? price,
      Value<int>? quantity}) {
    return OptionsCompanion(
      id: id ?? this.id,
      additionsId: additionsId ?? this.additionsId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['option_id'] = Variable<int>(id.value);
    }
    if (additionsId.present) {
      map['additions_id'] = Variable<int>(additionsId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OptionsCompanion(')
          ..write('id: $id, ')
          ..write('additionsId: $additionsId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $OptionsTable extends Options with TableInfo<$OptionsTable, Option> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OptionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'option_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _additionsIdMeta =
      const VerificationMeta('additionsId');
  @override
  late final GeneratedColumn<int?> additionsId = GeneratedColumn<int?>(
      'additions_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, additionsId, name, price, quantity];
  @override
  String get aliasedName => _alias ?? 'options';
  @override
  String get actualTableName => 'options';
  @override
  VerificationContext validateIntegrity(Insertable<Option> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('option_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['option_id']!, _idMeta));
    }
    if (data.containsKey('additions_id')) {
      context.handle(
          _additionsIdMeta,
          additionsId.isAcceptableOrUnknown(
              data['additions_id']!, _additionsIdMeta));
    } else if (isInserting) {
      context.missing(_additionsIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Option map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Option.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OptionsTable createAlias(String alias) {
    return $OptionsTable(attachedDatabase, alias);
  }
}

class Addition extends DataClass implements Insertable<Addition> {
  final int id;
  final int basketId;
  final String name;
  final String selectionType;
  Addition(
      {required this.id,
      required this.basketId,
      required this.name,
      required this.selectionType});
  factory Addition.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Addition(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}additions_id'])!,
      basketId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}basket_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      selectionType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}selection_type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['additions_id'] = Variable<int>(id);
    map['basket_id'] = Variable<int>(basketId);
    map['name'] = Variable<String>(name);
    map['selection_type'] = Variable<String>(selectionType);
    return map;
  }

  AdditionsCompanion toCompanion(bool nullToAbsent) {
    return AdditionsCompanion(
      id: Value(id),
      basketId: Value(basketId),
      name: Value(name),
      selectionType: Value(selectionType),
    );
  }

  factory Addition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Addition(
      id: serializer.fromJson<int>(json['id']),
      basketId: serializer.fromJson<int>(json['basketId']),
      name: serializer.fromJson<String>(json['name']),
      selectionType: serializer.fromJson<String>(json['selectionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'basketId': serializer.toJson<int>(basketId),
      'name': serializer.toJson<String>(name),
      'selectionType': serializer.toJson<String>(selectionType),
    };
  }

  Addition copyWith(
          {int? id, int? basketId, String? name, String? selectionType}) =>
      Addition(
        id: id ?? this.id,
        basketId: basketId ?? this.basketId,
        name: name ?? this.name,
        selectionType: selectionType ?? this.selectionType,
      );
  @override
  String toString() {
    return (StringBuffer('Addition(')
          ..write('id: $id, ')
          ..write('basketId: $basketId, ')
          ..write('name: $name, ')
          ..write('selectionType: $selectionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, basketId, name, selectionType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Addition &&
          other.id == this.id &&
          other.basketId == this.basketId &&
          other.name == this.name &&
          other.selectionType == this.selectionType);
}

class AdditionsCompanion extends UpdateCompanion<Addition> {
  final Value<int> id;
  final Value<int> basketId;
  final Value<String> name;
  final Value<String> selectionType;
  const AdditionsCompanion({
    this.id = const Value.absent(),
    this.basketId = const Value.absent(),
    this.name = const Value.absent(),
    this.selectionType = const Value.absent(),
  });
  AdditionsCompanion.insert({
    this.id = const Value.absent(),
    required int basketId,
    required String name,
    required String selectionType,
  })  : basketId = Value(basketId),
        name = Value(name),
        selectionType = Value(selectionType);
  static Insertable<Addition> custom({
    Expression<int>? id,
    Expression<int>? basketId,
    Expression<String>? name,
    Expression<String>? selectionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'additions_id': id,
      if (basketId != null) 'basket_id': basketId,
      if (name != null) 'name': name,
      if (selectionType != null) 'selection_type': selectionType,
    });
  }

  AdditionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? basketId,
      Value<String>? name,
      Value<String>? selectionType}) {
    return AdditionsCompanion(
      id: id ?? this.id,
      basketId: basketId ?? this.basketId,
      name: name ?? this.name,
      selectionType: selectionType ?? this.selectionType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['additions_id'] = Variable<int>(id.value);
    }
    if (basketId.present) {
      map['basket_id'] = Variable<int>(basketId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (selectionType.present) {
      map['selection_type'] = Variable<String>(selectionType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdditionsCompanion(')
          ..write('id: $id, ')
          ..write('basketId: $basketId, ')
          ..write('name: $name, ')
          ..write('selectionType: $selectionType')
          ..write(')'))
        .toString();
  }
}

class $AdditionsTable extends Additions
    with TableInfo<$AdditionsTable, Addition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdditionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'additions_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _basketIdMeta = const VerificationMeta('basketId');
  @override
  late final GeneratedColumn<int?> basketId = GeneratedColumn<int?>(
      'basket_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _selectionTypeMeta =
      const VerificationMeta('selectionType');
  @override
  late final GeneratedColumn<String?> selectionType = GeneratedColumn<String?>(
      'selection_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, basketId, name, selectionType];
  @override
  String get aliasedName => _alias ?? 'additions';
  @override
  String get actualTableName => 'additions';
  @override
  VerificationContext validateIntegrity(Insertable<Addition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('additions_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['additions_id']!, _idMeta));
    }
    if (data.containsKey('basket_id')) {
      context.handle(_basketIdMeta,
          basketId.isAcceptableOrUnknown(data['basket_id']!, _basketIdMeta));
    } else if (isInserting) {
      context.missing(_basketIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('selection_type')) {
      context.handle(
          _selectionTypeMeta,
          selectionType.isAcceptableOrUnknown(
              data['selection_type']!, _selectionTypeMeta));
    } else if (isInserting) {
      context.missing(_selectionTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Addition map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Addition.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AdditionsTable createAlias(String alias) {
    return $AdditionsTable(attachedDatabase, alias);
  }
}

class Basket extends DataClass implements Insertable<Basket> {
  final int id;
  final String order;
  final int quantity;
  final double price;
  Basket(
      {required this.id,
      required this.order,
      required this.quantity,
      required this.price});
  factory Basket.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Basket(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}basket_id'])!,
      order: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['basket_id'] = Variable<int>(id);
    map['order'] = Variable<String>(order);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    return map;
  }

  BasketsCompanion toCompanion(bool nullToAbsent) {
    return BasketsCompanion(
      id: Value(id),
      order: Value(order),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory Basket.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Basket(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<String>(json['order']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<String>(order),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
    };
  }

  Basket copyWith({int? id, String? order, int? quantity, double? price}) =>
      Basket(
        id: id ?? this.id,
        order: order ?? this.order,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('Basket(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, order, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Basket &&
          other.id == this.id &&
          other.order == this.order &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class BasketsCompanion extends UpdateCompanion<Basket> {
  final Value<int> id;
  final Value<String> order;
  final Value<int> quantity;
  final Value<double> price;
  const BasketsCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  BasketsCompanion.insert({
    this.id = const Value.absent(),
    required String order,
    required int quantity,
    required double price,
  })  : order = Value(order),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<Basket> custom({
    Expression<int>? id,
    Expression<String>? order,
    Expression<int>? quantity,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'basket_id': id,
      if (order != null) 'order': order,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  BasketsCompanion copyWith(
      {Value<int>? id,
      Value<String>? order,
      Value<int>? quantity,
      Value<double>? price}) {
    return BasketsCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['basket_id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<String>(order.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BasketsCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $BasketsTable extends Baskets with TableInfo<$BasketsTable, Basket> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BasketsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'basket_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<String?> order = GeneratedColumn<String?>(
      'order', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, order, quantity, price];
  @override
  String get aliasedName => _alias ?? 'baskets';
  @override
  String get actualTableName => 'baskets';
  @override
  VerificationContext validateIntegrity(Insertable<Basket> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('basket_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['basket_id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Basket map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Basket.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BasketsTable createAlias(String alias) {
    return $BasketsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $OptionsTable options = $OptionsTable(this);
  late final $AdditionsTable additions = $AdditionsTable(this);
  late final $BasketsTable baskets = $BasketsTable(this);
  late final BasketsDao basketsDao = BasketsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [options, additions, baskets];
}
