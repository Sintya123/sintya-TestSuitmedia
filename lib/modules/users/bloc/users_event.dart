part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersRequested extends UsersEvent {}

class UsersLoadMoreRequested extends UsersEvent {}

class UsersSelected extends UsersEvent {
  UsersSelected(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
