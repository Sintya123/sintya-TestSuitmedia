import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(const NameState()) {
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
  }
}
