import 'package:cancha_tenis/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../helpers/alert_dialog.dart';
import '../models/full_schedule.dart';
import 'custom_icon_button.dart';

class ScheduledCard extends StatelessWidget {
  const ScheduledCard({super.key, required this.schedule});

  final FullSchedule schedule;
  final rain = '99%';

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
                  "Cancha ${schedule.court} | ${schedule.time}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  DateFormat('dd/MM/yyyy').format(schedule.date),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                schedule.username,
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
                child: Text("${schedule.precipitation.toString()}%",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              )
            ],
          ),
          Consumer<AppState>(
            builder: (context, appState, child) {
              return CustomIconButton(
                  bgColor: kErrorColor,
                  icon: const Icon(Icons.delete),
                  onPressed: () => showAlertDialog(
                      context: context,
                      content: "¿Seguro que desea eliminar el agendamiento?",
                      showActions: true,
                      onReject: () => Navigator.pop(context),
                      onAccept: () {
                        appState.deleteSchedule(schedule.id);
                        Navigator.pop(context);
                      }));
            },
          )
        ]),
      ),
    );
  }
}
