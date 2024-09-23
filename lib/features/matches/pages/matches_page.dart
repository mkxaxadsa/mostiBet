import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/others/no_data.dart';
import '../bloc/matches_bloc.dart';
import '../widgets/match_card.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'MY MATCHES'),
        Expanded(
          child: BlocBuilder<MatchesBloc, MatchesState>(
            builder: (context, state) {
              if (state is MatchesLoadedState) {
                if (state.matches.isEmpty) return const NoData();

                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  children: [
                    const SizedBox(height: 13),
                    ...List.generate(
                      state.matches.length,
                      (index) {
                        return MatchCard(
                          match: state.matches[index],
                        );
                      },
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}
