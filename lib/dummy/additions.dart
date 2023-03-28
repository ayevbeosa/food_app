class Additions {
  late String optionName;
  late List<Options> options;
  late String selection;

  Additions({
    required this.optionName,
    required this.options,
    required this.selection,
  });
}

class Options {
  late String option;
  double price = 0.0;
  int quantity = 0;

  Options({
    required this.option,
    this.price = 0.0,
    this.quantity = 0,
  });
}
