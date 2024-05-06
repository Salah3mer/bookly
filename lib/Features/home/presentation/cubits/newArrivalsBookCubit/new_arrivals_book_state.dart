part of 'new_arrivals_book_cubit.dart';

sealed class NewArrivalsBookState extends Equatable {
  const NewArrivalsBookState();

  @override
  List<Object> get props => [];
}

final class NewArrivalsBookInitial extends NewArrivalsBookState {}

final class NewArrivalsBookLoadingState extends NewArrivalsBookState {}

final class NewArrivalsBookErrorState extends NewArrivalsBookState {
  final String error;

  const NewArrivalsBookErrorState(this.error);
}

final class NewArrivalsBookSucessState extends NewArrivalsBookState {
  final List<BookModel> book;

  const NewArrivalsBookSucessState(this.book);
}
