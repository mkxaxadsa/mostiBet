import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 75),
            const Row(
              children: [
                TextB(
                  'Matches, Puzzles\nand Articles - we\nhave everything a\ntrue football fan\nneeds!',
                  fontSize: 32,
                  maxLines: 10,
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/logo.png'),
            const Spacer(),
            PrimaryButton(
              title: 'GO',
              border: false,
              color: AppColors.orange,
              onPressed: () async {
                await saveOnboard().then((_) {
                  if (context.mounted) context.go('/home');
                });
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
