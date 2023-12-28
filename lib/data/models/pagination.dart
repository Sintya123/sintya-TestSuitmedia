import 'package:equatable/equatable.dart';

class Pagination<T> extends Equatable {
  const Pagination({
    this.page = 1,
    this.perPage = 10,
    this.total = 10,
    this.totalPage = 10,
    this.data = const [],
  });

  factory Pagination.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) builder,
  ) {
    return Pagination<T>(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      totalPage: map['total_pages'] as int,
      data: (map['data'] as List)
          .map((dynamic e) => builder(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final int page;
  final int perPage;
  final int total;
  final int totalPage;
  final List<T> data;

  bool get hasReachedMax => page >= totalPage;

  @override
  List<Object?> get props {
    return [page, perPage, total, totalPage, data];
  }
}
