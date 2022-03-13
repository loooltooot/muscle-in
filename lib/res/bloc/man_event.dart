part of 'man_bloc.dart';

@immutable
abstract class ManEvent {}

class ManManificate extends ManEvent {
  String text;
  ManManificate(this.text);
}
