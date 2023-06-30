import 'package:cancha_tenis/constants/colors.dart';
import 'package:cancha_tenis/models/create_schedule.dart';
import 'package:cancha_tenis/services/court_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/alert_dialog.dart';
import '../state/app_state.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/court_select.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/date_field.dart';
import '../widgets/name_field.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime? date;
  CourtMetadata? court;
  String? username;

  bool isValid() {
    return court == null || date == null || username == null || username == '';
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: <Widget>[
          const Top(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DateField(
                        onChange: (value) {
                          setState(() {
                            date = value;
                          });
                        },
                        selectedDate: date,
                      ),
                      date == null
                          ? Container()
                          : CourtSelect(
                              selectedDate: date!,
                              onChange: (selectedCourt) {
                                setState(() {
                                  court = selectedCourt;
                                });
                              },
                            ),
                      court == null
                          ? Container()
                          : NameField(
                              onChange: (value) {
                                setState(() {
                                  username = value;
                                });
                              },
                            )
                    ],
                  ),
                  isValid()
                      ? Container()
                      : Consumer<AppState>(builder: (context, appState, child) {
                          return CustomButton(
                            text: 'AGENDAR',
                            onPressed: () {
                              appState.addSchedule(CreateSchedule(
                                  courtId: court!.courtId,
                                  timeId: court!.timeId,
                                  date: date!,
                                  username: username!));
                              Navigator.pop(context);
                              showAlertDialog(
                                context: context,
                                content: "Agendamiento agregado.",
                              );
                            },
                            color: kSuccessColor,
                          );
                        })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          // icon: SvgPicture.asset('assets/icons/left-arrow.svg'),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Agendar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
