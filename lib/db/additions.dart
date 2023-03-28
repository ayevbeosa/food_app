import 'package:moor/moor.dart';

class Additions extends Table {
  IntColumn get id => integer().named('additions_id').autoIncrement()();

  IntColumn get basketId => integer()();

  TextColumn get name => text()();

  TextColumn get selectionType => text()();
}
