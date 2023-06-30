import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../services/forecast_service.dart';

class DateField extends StatefulWidget {
  const DateField(
      {super.key, required this.onChange, required this.selectedDate});

  final Function(DateTime) onChange;
  final DateTime? selectedDate;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final name = 'Fecha';
  int? precipitation;

  Future _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 10)),
    );
    if (selected != null && selected != widget.selectedDate) {
      widget.onChange(selected);

      int prob = await ForecastService.getPricipitationProbabilityMax(selected);

      setState(() {
        precipitation = prob;
      });
    }
  }

  String getDate() {
    if (widget.selectedDate == null) {
      return 'Seleccionar fecha';
    } else {
      return DateFormat('dd / MM / yyyy').format(widget.selectedDate!);
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
          Row(
            children: [
              Expanded(
                child: Container(
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
                ),
              ),
              precipitation != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Icon(Icons.cloudy_snowing),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text("${precipitation.toString()}%",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}
