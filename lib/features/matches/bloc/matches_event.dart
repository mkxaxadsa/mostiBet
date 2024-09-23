part of 'matches_bloc.dart';

abstract class MatchesEvent {}

class GetMatchesEvent extends MatchesEvent {}

class AddMatchEvent extends MatchesEvent {
  final MatchModel match;
  AddMatchEvent({required this.match});
}

class EditMatchEvent extends MatchesEvent {
  final MatchModel match;
  EditMatchEvent({required this.match});
}

class DeleteMatchEvent extends MatchesEvent {
  final int id;
  DeleteMatchEvent({required this.id});
}
