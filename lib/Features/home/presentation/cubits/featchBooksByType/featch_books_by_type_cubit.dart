import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repoes/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featch_books_by_type_state.dart';

class FeatchBooksByTypeCubit extends Cubit<FeatchBooksByTypeState> {
  final HomeRepo homeRepo;

  FeatchBooksByTypeCubit(this.homeRepo) : super(FeatchBooksByTypeInitial());
  Future<void> featchBooksByType({required String type}) async {
    emit(FeatchBooksByTypeLoadingState());
    var resault = await homeRepo.featchBookByType(type: type);
    resault.fold((failuer) => emit(FeatchBooksByTypeErrorState(failuer.error)),
        (book) => emit(FeatchBooksByTypeSucessState(book)));
  }
}
