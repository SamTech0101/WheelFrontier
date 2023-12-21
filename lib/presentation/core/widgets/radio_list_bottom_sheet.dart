import 'dart:async';

import 'package:flutter/material.dart';

// it opens a bottom sheet with alist of rado options for user to decide between
// and returs the selected [item]

Future<String> radioListBottomSheet({
  BuildContext context,
  List<String> options,
  String prevChosenOption,
}) async {
  RadioListDataProvider radioListDataProvider = RadioListDataProvider(
    selectedItem: prevChosenOption != null ? prevChosenOption : '',
    child: RadioListBottomSheet(options: options),
  );
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => radioListDataProvider,
  );
  return radioListDataProvider.selectedItem;
}

class RadioListBottomSheet extends StatefulWidget {
  final List<String> options;

  RadioListBottomSheet({@required this.options});

  @override
  _RadioListBottomSheetState createState() => _RadioListBottomSheetState();
}

class _RadioListBottomSheetState extends State<RadioListBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final provider = RadioListDataProvider.of(context);
    double containerHeight = (widget.options.length * 60).toDouble();
    return Container(
      height: containerHeight < 400 ? containerHeight : 400,
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
              itemBuilder: (context, index) => RadioListTile(
                title: Text(widget.options[index]),
                value: widget.options[index],
                groupValue: provider.selectedItem,
                onChanged: (value) {
                  setState(() {
                    provider.selectedItem = value;
                    Timer.periodic(Duration(milliseconds: 200), (timer) {
                      timer.cancel();
                      Navigator.pop(context);
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioListDataProvider extends InheritedWidget {
  String selectedItem;
  RadioListDataProvider({
    Widget child,
    this.selectedItem,
  }) : super(child: child);
  @override
  bool updateShouldNotify(RadioListDataProvider oldWidget) =>
      selectedItem != oldWidget.selectedItem;
  static RadioListDataProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RadioListDataProvider>();
}
