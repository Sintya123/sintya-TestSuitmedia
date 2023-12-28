part of 'users_bloc.dart';

enum UsersStateStatus { initial, success, failure }

class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStateStatus.initial,
    this.users = const [],
    this.selected,
    this.page = 1,
    this.hasReachedMax = false,
  });

  final UsersStateStatus status;
  final List<User> users;
  final User? selected;
  final int page;
  final bool hasReachedMax;

  int get itemCount => hasReachedMax ? users.length : users.length + 1;

  @override
  List<Object?> get props => [status, users, selected, page, hasReachedMax];

  UsersState copyWith({
    UsersStateStatus? status,
    List<User>? users,
    User? selected,
    int? page,
    bool? hasReachedMax,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      selected: selected ?? this.selected,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
