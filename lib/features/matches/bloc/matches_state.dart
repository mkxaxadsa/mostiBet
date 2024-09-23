part of 'matches_bloc.dart';

abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class MatchesLoadedState extends MatchesState {
  final List<MatchModel> matches;
  MatchesLoadedState({required this.matches});
}
