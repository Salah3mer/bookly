import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBookByName(
      {required String name}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$name');
      List<BookModel> books = [];
      for (var i in data['items']) {
        try {
          books.add(BookModel.fromJson(i));
        } catch (e) {
          books.add(BookModel.fromJson(i));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
