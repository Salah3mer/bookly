import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repoes/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchBookByType(
      {required String type}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:$type');
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

  @override
  Future<Either<Failure, List<BookModel>>> featchNewArrivalsBook() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=all&sorting=newest');

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
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
