import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/models/match_model.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../home/bloc/home_bloc.dart';
import '../bloc/matches_bloc.dart';
import '../widgets/star_button.dart';

class AddMatchPage extends StatefulWidget {
  const AddMatchPage({super.key});

  @override
  State<AddMatchPage> createState() => AddMatchPageState();
}

class AddMatchPageState extends State<AddMatchPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
  final controller8 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
        controller5,
        controller6,
        controller7,
        controller8,
      ]);
    });
  }

  void onStar1(int value) {
    controller7.text = value.toString();
    checkActive();
  }

  void onStar2(int value) {
    controller8.text = value.toString();
    checkActive();
  }

  void onSave() {
    context.read<MatchesBloc>().add(
          AddMatchEvent(
            match: MatchModel(
              id: getCurrentTimestamp(),
              team1: controller1.text,
              team2: controller2.text,
              score1: int.tryParse(controller3.text) ?? 0,
              score2: int.tryParse(controller4.text) ?? 0,
              date: controller5.text,
              time: controller6.text,
              rate1: int.tryParse(controller3.text) ?? 1,
              rate2: int.tryParse(controller3.text) ?? 1,
            ),
          ),
        );
    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'ADD MATCHES'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              const SizedBox(height: 14),
              const TextM('Team names', fontSize: 20),
              const SizedBox(height: 14),
              TxtField(
                controller: controller1,
                hintText: 'Team one',
                onChanged: checkActive,
              ),
              const SizedBox(height: 14),
              TxtField(
                controller: controller2,
                hintText: 'Team two',
                onChanged: checkActive,
              ),
              const SizedBox(height: 27),
              const TextM('Score team one', fontSize: 20),
              const SizedBox(height: 14),
              TxtField(
                controller: controller3,
                hintText: 'Enter score',
                number: true,
                length: 2,
                onChanged: checkActive,
              ),
              const SizedBox(height: 27),
              const TextM('Score team two', fontSize: 20),
              const SizedBox(height: 14),
              TxtField(
                controller: controller4,
                hintText: 'Enter score',
                number: true,
                length: 2,
                onChanged: checkActive,
              ),
              const SizedBox(height: 27),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      const TextM('Date', fontSize: 20),
                      const SizedBox(height: 14),
                      TxtField(
                        controller: controller5,
                        hintText: '00.00.0000',
                        datePicker: true,
                        prefix: false,
                        width: 150,
                        onChanged: checkActive,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const TextM('Time', fontSize: 20),
                      const SizedBox(height: 14),
                      TxtField(
                        controller: controller6,
                        hintText: '00:00',
                        timePicker: true,
                        width: 150,
                        onChanged: checkActive,
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 27),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const TextM('Rating team one', fontSize: 20),
                        const SizedBox(height: 14),
                        StarButton(
                          rate: int.tryParse(controller7.text) ?? 0,
                          onTap: onStar1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        const TextM('Rating team two', fontSize: 20),
                        const SizedBox(height: 14),
                        StarButton(
                          rate: int.tryParse(controller8.text) ?? 0,
                          onTap: onStar2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27),
              PrimaryButton(
                title: 'Save',
                active: active,
                onPressed: onSave,
              ),
              const SizedBox(height: 58),
            ],
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}
