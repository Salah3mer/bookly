import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepe;
  SearchCubit(this.searchRepe) : super(SearchInitial());
  TextEditingController searchController = TextEditingController();

  Future<void> searchingForBooks({required String name}) async {
    emit(SearchLoadingState());
    var resulte = await searchRepe.searchBookByName(name: name);
    resulte.fold((failure) => emit(SearchErrorState(error: failure.toString())),
        (books) => emit(SearchSuccessState(books: books)));
  }
}
