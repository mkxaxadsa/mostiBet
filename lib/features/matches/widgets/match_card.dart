import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match_model.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/matches_bloc.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: AppColors.black35,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 40,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: TextM(
                          match.team1,
                          fontSize: 20,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      child: Center(
                        child: TextM('VS', fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TextM(
                          match.team2,
                          fontSize: 20,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    _Stars(rate: match.rate1),
                    const Spacer(),
                    _Stars(rate: match.rate2),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: TextR(
                        match.date,
                        fontSize: 16,
                        color: AppColors.border,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Center(
                        child: TextM(
                          '${match.score1}:${match.score2}',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextR(
                        match.time,
                        fontSize: 16,
                        color: AppColors.border,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CupertinoButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(
                      title: 'Delete Match?',
                      onYes: () {
                        context
                            .read<MatchesBloc>()
                            .add(DeleteMatchEvent(id: match.id));
                      },
                    );
                  },
                );
              },
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 12,
              ),
              child: SvgPicture.asset('assets/close.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.rate});

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Star(active: rate >= 1),
        _Star(active: rate >= 2),
        _Star(active: rate >= 3),
        _Star(active: rate >= 4),
        _Star(active: rate >= 5),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Center(
        child: SvgPicture.asset(
          'assets/star.svg',
          color: active ? AppColors.orange : AppColors.border,
        ),
      ),
    );
  }
}
