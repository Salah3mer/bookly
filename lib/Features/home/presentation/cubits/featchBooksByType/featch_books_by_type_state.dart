part of 'featch_books_by_type_cubit.dart';

sealed class FeatchBooksByTypeState extends Equatable {
  const FeatchBooksByTypeState();

  @override
  List<Object> get props => [];
}

final class FeatchBooksByTypeInitial extends FeatchBooksByTypeState {}

final class FeatchBooksByTypeLoadingState extends FeatchBooksByTypeState {}

final class FeatchBooksByTypeSucessState extends FeatchBooksByTypeState {
  final List<BookModel> books;

  const FeatchBooksByTypeSucessState(this.books);
}

final class FeatchBooksByTypeErrorState extends FeatchBooksByTypeState {
  final String error;

  const FeatchBooksByTypeErrorState(this.error);
}
