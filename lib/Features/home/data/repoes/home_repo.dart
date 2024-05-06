import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> featchBookByType(
      {required String type});
  Future<Either<Failure, List<BookModel>>> featchNewArrivalsBook();
}
