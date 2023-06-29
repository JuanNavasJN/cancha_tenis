import 'package:cancha_tenis/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/court_select.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/date_field.dart';
import '../widgets/name_field.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

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
                  const Column(
                    children: [DateField(), CourtSelect(), NameField()],
                  ),
                  CustomButton(
                    text: 'AGENDAR',
                    onPressed: () {},
                    color: kSuccessColor,
                  )
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
