import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_icon_button.dart';

class ScheduledCard extends StatelessWidget {
  const ScheduledCard({super.key});

  final court = 'Cancha A | 9-12';
  final date = '12/07/2023';
  final name = 'Anett Numa Perez';
  final rain = '99%';

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(color: kTextColor),
      ),
      onPressed: () => Navigator.pop(context),
    );
    Widget continueButton = TextButton(
      child: const Text("Si"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      content: const Text("¿Seguro de que desea eliminar el agendamiento?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: kLightBackgroundColor,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 90.0,
        decoration: boxDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  court,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  date,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.cloudy_snowing),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(rain,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              )
            ],
          ),
          CustomIconButton(
              bgColor: kErrorColor,
              icon: const Icon(Icons.delete),
              onPressed: () => showAlertDialog(context))
        ]),
      ),
    );
  }
}
