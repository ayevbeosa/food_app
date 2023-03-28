import 'package:moor/moor.dart';

class Options extends Table {
  IntColumn get id => integer().named('option_id').autoIncrement()();

  IntColumn get additionsId => integer().named('additions_id')();

  TextColumn get name => text()();

  RealColumn get price => real()();

  IntColumn get quantity => integer().withDefault(const Constant(0))();
}
