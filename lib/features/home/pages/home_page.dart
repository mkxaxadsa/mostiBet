import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../matches/pages/add_match_page.dart';
import '../../matches/pages/matches_page.dart';
import '../../news/pages/news_page.dart';
import '../../puzzle/pages/puzzle_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeMatches) return const AddMatchPage();

              if (state is HomeNews) return const NewsPage();

              if (state is HomePuzzle) return const PuzzlePage();

              return const MatchesPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
