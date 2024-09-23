import 'package:flutter/cupertino.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.border = true,
    this.color = AppColors.main,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool border;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          border: border ? Border.all(color: AppColors.border) : null,
        ),
        child: CupertinoButton(
          onPressed: active ? onPressed : null,
          padding: EdgeInsets.zero,
          child: Center(
            child: TextM(
              title,
              fontSize: 20,
              color: active ? AppColors.white : AppColors.bg,
            ),
          ),
        ),
      ),
    );
  }
}
