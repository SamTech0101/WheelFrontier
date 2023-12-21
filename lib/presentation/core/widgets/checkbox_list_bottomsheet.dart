import 'package:flutter/material.dart';

// it opens a bottom sheet with alist of options for user to decide between
// and returs the selected items

Future<List<String>> checkBoxBottomSheet({
  BuildContext context,
  List<String> options,
  List<String> prevChosenOptions,
}) async {
  CheckBoxListDataProvider checkBoxListDataProvider = CheckBoxListDataProvider(
    child: CheckBoxListPicker(options: options),
    selectedItems: prevChosenOptions != null ? prevChosenOptions : [],
  );
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => checkBoxListDataProvider,
  );
  return checkBoxListDataProvider.selectedItems;
}

class CheckBoxListPicker extends StatefulWidget {
  final List<String> options;

  CheckBoxListPicker({@required this.options});

  @override
  _CheckBoxListPickerState createState() => _CheckBoxListPickerState();
}

class _CheckBoxListPickerState extends State<CheckBoxListPicker> {
  @override
  Widget build(BuildContext context) {
    final selectedItems = CheckBoxListDataProvider.of(context).selectedItems;
    double containerHeight = (widget.options.length * 60).toDouble();
    return Container(
      height: containerHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (context, index) => CheckboxListTile(
                title: Text(widget.options[index]),
                value: selectedItems.contains(widget.options[index]),
                onChanged: (newValue) {
                  if (selectedItems.contains(widget.options[index]) == false) {
                    selectedItems.add(widget.options[index]);
                  } else {
                    selectedItems.remove(widget.options[index]);
                  }
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxListDataProvider extends InheritedWidget {
  final List<String> selectedItems;
  CheckBoxListDataProvider({
    Widget child,
    this.selectedItems,
  }) : super(child: child);
  @override
  bool updateShouldNotify(CheckBoxListDataProvider oldWidget) =>
      selectedItems != oldWidget.selectedItems;
  static CheckBoxListDataProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CheckBoxListDataProvider>();
}
