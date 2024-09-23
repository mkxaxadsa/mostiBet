import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({super.key, this.win = true});

  final bool win;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: AppColors.main,
        child: SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width > 300 ? 300 : null,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextB(
                win ? 'Well done!' : 'Loose!',
                fontSize: 20,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Close',
                color: AppColors.orange,
                border: false,
                onPressed: () {
                  context.pop();
                  context.pop();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
