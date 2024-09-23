import 'package:flutter/cupertino.dart';

class PuzzlePiece extends StatelessWidget {
  const PuzzlePiece({
    super.key,
    required this.id,
    required this.puzzleID,
    required this.started,
    required this.onPressed,
  });

  final int id;
  final int puzzleID;
  final bool started;
  final void Function(int) onPressed;

  String getPuzzleAsset(int id) {
    if (id == 1) return 'cup';
    if (id == 2) return 'goalkeeper';
    if (id == 3) return 'helmet';
    if (id == 4) return 'boots';
    return 'cup';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 3 - 80 / 3;

    return CupertinoButton(
      onPressed: started
          ? () {
              onPressed(puzzleID);
            }
          : null,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: size,
        width: size,
        child: Image.asset('assets/puzzle/${getPuzzleAsset(id)}$puzzleID.png'),
      ),
    );
  }
}
