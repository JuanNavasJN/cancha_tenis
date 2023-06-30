import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.onChange});

  final Function(String) onChange;

  final name = 'Nombre';

  @override
  Widget build(BuildContext context) {
    const hint = 'Ingresar nombre del usuario';

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
            child: TextField(
              onChanged: onChange,
              decoration: const InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: kSuccessColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
            ),
          )
        ],
      ),
    );
  }
}
