import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/puzzle_card.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages2(context);

    return Column(
      children: [
        const CustomAppbar(title: 'PUZZLES'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            children: const [
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: TextM(
                  'Сhoose the puzzle you like and assemble it',
                  fontSize: 20,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleGameCard(
                    id: 1,
                    title: 'Cup',
                  ),
                  SizedBox(width: 15),
                  PuzzleGameCard(
                    id: 2,
                    title: 'Goalkeeper',
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleGameCard(
                    id: 3,
                    title: 'Helmet',
                  ),
                  SizedBox(width: 15),
                  PuzzleGameCard(
                    id: 4,
                    title: 'Boots',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}
