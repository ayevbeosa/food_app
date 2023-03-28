import 'options.dart';

class Additions {
  late String optionName;
  late String selectionType;
  List<Options> optionList = [];

  Additions({
    required this.optionName,
    required this.selectionType,
    required this.optionList,
  });

  Additions.fromJson(dynamic json) {
    optionName = json['option_name'];
    selectionType = json['selection_type'];
    if (json['options'] != null) {
      json['options'].forEach((v) {
        optionList.add(Options.fromJson(v));
      });
    }
  }
}
