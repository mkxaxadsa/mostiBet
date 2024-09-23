import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class PuzzleGameCard extends StatelessWidget {
  const PuzzleGameCard({
    super.key,
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2 - 28 - 15;

    return SizedBox(
      height: size,
      width: size,
      child: CupertinoButton(
        onPressed: () {
          context.push('/home/puzzle', extra: title);
        },
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/puzzle$id.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.white),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff000000).withOpacity(0),
                    const Color(0xff163B4B),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: TextM(
                title,
                fontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
