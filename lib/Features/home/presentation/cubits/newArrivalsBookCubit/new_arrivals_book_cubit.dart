import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repoes/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'new_arrivals_book_state.dart';

class NewArrivalsBookCubit extends Cubit<NewArrivalsBookState> {
  final HomeRepo homeRepo;
  NewArrivalsBookCubit(this.homeRepo) : super(NewArrivalsBookInitial());
  Future<void> getNewArrivalsBook() async {
    emit(NewArrivalsBookLoadingState());
    var resulte = await homeRepo.featchNewArrivalsBook();
    resulte.fold((failure) => emit(NewArrivalsBookErrorState(failure.error)),
        (book) => emit(NewArrivalsBookSucessState(book)));
  }
}
