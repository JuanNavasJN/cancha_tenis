import 'package:cancha_tenis/constants/colors.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Cancha A | 14-17',
  'Cancha B | 14-17',
  'Cancha C | 14-17',
  'Cancha D | 14-17'
];

class CourtSelect extends StatefulWidget {
  const CourtSelect({super.key});

  @override
  State<CourtSelect> createState() => _CourtSelectState();
}

class _CourtSelectState extends State<CourtSelect> {
  String? dropdownValue;

  final name = 'Cancha';
  final hint = 'Seleccionar cancha';

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
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kLightBackgroundColor,
                borderRadius: BorderRadius.circular(10.0)),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hint),
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 28.0,
              ),
              elevation: 16,
              borderRadius: BorderRadius.circular(10.0),
              dropdownColor: kLightBackgroundColor,
              underline: Container(
                height: 0,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
