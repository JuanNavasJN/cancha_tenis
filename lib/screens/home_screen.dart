import 'package:cancha_tenis/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../state/app_state.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/scheduled_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: <Widget>[
          const Top(),
          Expanded(
            child: Consumer<AppState>(builder: (context, appState, child) {
              if (appState.schedules == null) {
                return Container();
              } else {
                return ListView(
                    padding: const EdgeInsets.only(top: 15.0),
                    children: appState.schedules!
                        .map((schedule) => ScheduledCard(schedule: schedule))
                        .toList());
              }
            }),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Agendamientos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        CustomIconButton(
          bgColor: kSuccessColor,
          // icon: SvgPicture.asset('assets/icons/plus.svg'),
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const ScheduleScreen(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
        )
      ],
    );
  }
}
