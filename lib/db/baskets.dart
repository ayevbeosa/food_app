import 'package:moor/moor.dart';

class Baskets extends Table {
  IntColumn get id => integer().named('basket_id').autoIncrement()();

  TextColumn get order => text()();

  IntColumn get quantity => integer()();

  RealColumn get price => real()();
}
