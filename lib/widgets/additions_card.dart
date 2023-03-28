import 'package:flutter/material.dart';
import 'package:food_app/dummy/additions.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/widgets/icon_checkbox.dart';

class AdditionsCard extends StatefulWidget {
  final Additions additions;
  final ValueSetter<Options> onOptionSelected;
  final ValueSetter<Options> onOptionUnSelected;

  AdditionsCard({
    required this.additions,
    required this.onOptionSelected,
    required this.onOptionUnSelected,
  });

  @override
  _AdditionsCardState createState() => _AdditionsCardState(
        this.additions.selection,
        this.additions.options,
        this.additions.optionName,
        this.onOptionSelected,
        this.onOptionUnSelected,
      );
}

class _AdditionsCardState extends State<AdditionsCard> {
  final String _selection;
  final String _optionName;
  final List<Options> _optionsList;
  final ValueSetter<Options> _onOptionSelected;
  final ValueSetter<Options> _onOptionUnSelected;

  Options? _groupValue;
  List<String> optionsState = [];

  _AdditionsCardState(
    this._selection,
    this._optionsList,
    this._optionName,
    this._onOptionSelected,
    this._onOptionUnSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kPaddingVertical16,
      child: Padding(
        padding: kPadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _optionName.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            Divider(),
            Column(
              children: List.generate(
                _optionsList.length,
                (index) {
                  final Options option = _optionsList[index];

                  if (_selection == 'multiple') {
                    return CheckboxListTile(
                      title: _buildListTileTitleWidget(option),
                      value: optionsState.contains(option.option),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            optionsState.add(option.option);
                            _onOptionSelected(option);
                          } else {
                            optionsState.remove(option.option);
                            _onOptionUnSelected(option);
                          }
                        });
                      },
                    );
                  } else if (_selection == 'dual') {
                    return IconCheckbox(
                      title: _buildListTileTitleWidget(option),
                      value: optionsState.contains(option.option),
                      quantity: option.quantity,
                      onIconButtonPressed: () {
                        setState(() {
                          option.quantity = 0;
                          _onOptionUnSelected(option);
                        });
                      },
                      onBodyPressed: () {
                        setState(() {
                          option.quantity++;
                          _onOptionSelected(option);
                        });
                      },
                    );
                  } else {
                    return RadioListTile<Options>(
                      title: _buildListTileTitleWidget(option),
                      value: option,
                      groupValue: _groupValue,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (Options? value) {
                        setState(() {
                          if (_groupValue != null) {
                            _onOptionUnSelected(_groupValue!);
                            _onOptionSelected(value!);
                          } else {
                            _onOptionSelected(value!);
                          }
                          _groupValue = value;
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileTitleWidget(Options options) {
    if (options.price != 0.0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              options.option,
              textScaleFactor: 1.15,
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '+(£${options.price})',
              textScaleFactor: 1.15,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );
    } else {
      return Text(options.option);
    }
  }
}
