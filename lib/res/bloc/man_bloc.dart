import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gigamusculerator/res/models/manificator.dart';
import 'package:meta/meta.dart';

part 'man_event.dart';
part 'man_state.dart';

class ManBloc extends Bloc<ManEvent, ManState> {
  ManBloc() : super(ManInitial()) {
    on<ManManificate>((event, emit) {
      emit(ManLoading());

      emit(ManEnded(Manificator.manification(event.text)));
    });
  }
}
