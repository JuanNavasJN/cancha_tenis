import 'package:cancha_tenis/screens/schedule_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
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
            child: ListView(
              padding: const EdgeInsets.only(top: 15.0),
              children: const [
                ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
                // ScheduledCard(),
              ],
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
