import 'package:testsuitmedia/data/models/models.dart';
import 'package:testsuitmedia/data/services/services.dart';

abstract class UserRepository {
  Future<Pagination<User>> findAll({int page = 1});

  Future<User?> findById();
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.api);

  final ApiService api;

  @override
  Future<Pagination<User>> findAll({int page = 1}) async {
    final response = await api.get<Map<String, dynamic>>(
      '/users',
      queryParameters: <String, dynamic>{'page': page, 'per_page': 10},
    );
    if (response.statusCode != 200 || response.data == null) {
      throw Exception(response.statusMessage);
    }
    return Pagination.fromMap(
      response.data!,
      (value) => User.fromMap(value),
    );
  }

  @override
  Future<User?> findById() {
    // ignore: flutter_style_todos
    // TODO: implement findById
    throw UnimplementedError();
  }
}
