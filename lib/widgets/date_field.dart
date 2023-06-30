import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class DateField extends StatelessWidget {
  const DateField(
      {super.key, required this.onChange, required this.selectedDate});

  final Function(DateTime) onChange;
  final DateTime? selectedDate;
  final name = 'Fecha';

  Future _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      onChange(selected);
    }
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'Seleccionar fecha';
    } else {
      return DateFormat('dd / MM / yyyy').format(selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: kLightBackgroundColor,
                borderRadius: BorderRadius.circular(10.0)),
            height: 50.0,
            child: RawMaterialButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text(getDate()),
            ),
          )
        ],
      ),
    );
  }
}
