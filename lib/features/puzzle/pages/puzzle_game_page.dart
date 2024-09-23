import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/puzzle_piece.dart';
import '../widgets/wid_dialog.dart';

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PuzzleGamePage> createState() => _PuzzleGamePageState();
}

class _PuzzleGamePageState extends State<PuzzleGamePage> {
  int _start = 15;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const WinDialog(win: false);
          },
        );
      }
    });
  }

  int getId() {
    if (widget.title == 'Cup') return 1;
    if (widget.title == 'Goalkeeper') return 2;
    if (widget.title == 'Helmet') return 3;
    if (widget.title == 'Boots') return 4;
    return 1;
  }

  List<int> pieces = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  int? firstSelectedIndex;

  void check() {
    if (pieces[0] == 1 &&
        pieces[1] == 2 &&
        pieces[2] == 3 &&
        pieces[3] == 4 &&
        pieces[4] == 5 &&
        pieces[5] == 6 &&
        pieces[6] == 7 &&
        pieces[7] == 8 &&
        pieces[8] == 9) {
      _timer?.cancel();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const WinDialog();
        },
      );
    }
  }

  void swapValues(int firstIndex, int secondIndex) {
    setState(() {
      try {
        int temp = pieces[firstIndex];
        pieces[firstIndex] = pieces[secondIndex];
        pieces[secondIndex] = temp;
        firstSelectedIndex = null;
      } catch (e) {
        print(e.toString());
      }
    });
    check();
  }

  bool started = false;

  void onShuffle() {
    setState(() {
      started = true;
      pieces.shuffle();
    });
    startTimer();
  }

  void onPuzzle(int id) {
    if (firstSelectedIndex == null) {
      firstSelectedIndex = pieces.indexOf(id);
    } else {
      int secondSelectedIndex = pieces.indexOf(id);
      if (secondSelectedIndex == firstSelectedIndex) return;
      swapValues(firstSelectedIndex!, secondSelectedIndex);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: widget.title,
            back: true,
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextM(
                'Time: 00:',
                fontSize: 20,
              ),
              TextM(
                _start.toString().padLeft(2, '0'),
                fontSize: 20,
                color: AppColors.orange,
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[0],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[1],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[2],
                started: started,
                onPressed: onPuzzle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[3],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[4],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[5],
                started: started,
                onPressed: onPuzzle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[6],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[7],
                started: started,
                onPressed: onPuzzle,
              ),
              const SizedBox(width: 8),
              PuzzlePiece(
                id: getId(),
                puzzleID: pieces[8],
                started: started,
                onPressed: onPuzzle,
              ),
            ],
          ),
          if (!started) ...[
            const Spacer(),
            const TextM('Click "Shuffle" to start', fontSize: 20),
            const Spacer(),
            PrimaryButton(
              title: 'Shuffle',
              onPressed: onShuffle,
            ),
          ],
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
