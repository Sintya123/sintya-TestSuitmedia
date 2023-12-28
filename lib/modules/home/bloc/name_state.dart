part of 'name_bloc.dart';

class NameState extends Equatable {
  const NameState({this.name = ''});

  final String name;

  bool get isValid => name.isNotEmpty;

  @override
  List<Object?> get props => [name];

  NameState copyWith({
    String? name,
  }) {
    return NameState(
      name: name ?? this.name,
    );
  }
}
