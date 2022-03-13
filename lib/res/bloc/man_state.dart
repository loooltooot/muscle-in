part of 'man_bloc.dart';

@immutable
abstract class ManState {}

class ManInitial extends ManState {}

class ManLoading extends ManState {}
class ManEnded extends ManState {
  List<String> words;
  ManEnded(this.words);
}
