part of 'name_bloc.dart';

@immutable
abstract class NameEvent {}

class NameChanged extends NameEvent {
  NameChanged(this.name);

  final String name;
}
