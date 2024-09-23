import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class StarButton extends StatelessWidget {
  const StarButton({
    super.key,
    required this.rate,
    required this.onTap,
  });

  final int rate;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Button(
            id: 1,
            active: rate >= 1,
            onTap: onTap,
          ),
          _Button(
            id: 2,
            active: rate >= 2,
            onTap: onTap,
          ),
          _Button(
            id: 3,
            active: rate >= 3,
            onTap: onTap,
          ),
          _Button(
            id: 4,
            active: rate >= 4,
            onTap: onTap,
          ),
          _Button(
            id: 5,
            active: rate >= 5,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.active,
    required this.onTap,
  });

  final int id;
  final bool active;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(id);
      },
      child: SizedBox(
        height: 45,
        width: 30,
        child: Center(
          child: SvgPicture.asset(
            'assets/star.svg',
            color: active ? AppColors.orange : AppColors.border,
          ),
        ),
      ),
    );
  }
}
