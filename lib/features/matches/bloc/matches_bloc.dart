import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/match_model.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc() : super(MatchesInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      await getMatches();
      emit(MatchesLoadedState(matches: DB.matchesList));
    });

    on<AddMatchEvent>((event, emit) async {
      DB.matchesList.insert(0, event.match);
      await updateMatches();
      emit(MatchesLoadedState(matches: DB.matchesList));
    });

    on<EditMatchEvent>((event, emit) async {
      for (MatchModel match in DB.matchesList) {
        if (match.id == event.match.id) {
          match.team1 = event.match.team1;
          match.team2 = event.match.team2;
          match.score1 = event.match.score1;
          match.score2 = event.match.score2;
        }
      }
      await updateMatches();
      emit(MatchesLoadedState(matches: DB.matchesList));
    });

    on<DeleteMatchEvent>((event, emit) async {
      DB.matchesList.removeWhere((element) => element.id == event.id);
      await updateMatches();
      emit(MatchesLoadedState(matches: DB.matchesList));
    });
  }
}
