import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/utils/params.dart';
import '../../domain/entities/news.dart';
import '../../domain/usecases/get_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required GetNews getNews})
      : _getNews = getNews,
        super(NewsState.initialState()) {
    on<_TransitionPage>(_transitionPage);
    on<_DetailView>(_detailView);
    on<_UpdateIndex>(_updateIndex);
    on<_UpdateLanguaje>(_updateLanguaje);
  }
  final GetNews _getNews;
  late final PageController _pageController;
  PageController get pageController => _pageController;

  void init() {
    _pageController = PageController(initialPage: 0);
  }

  FutureOr<void> _transitionPage(
      _TransitionPage event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: NewStatus.loading, param: event.param));
    final results = await _getNews(param: event.param);
    results.fold(
        (error) => emit(
            state.copyWith(msgError: error.message, status: NewStatus.error)),
        (news) => emit(state.copyWith(status: NewStatus.success, news: news)));
  }

  FutureOr<void> _detailView(_DetailView event, Emitter<NewsState> emit) async {
    emit(state.copyWith(newDetail: event.newDetail));
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }

  FutureOr<void> _updateIndex(_UpdateIndex event, Emitter<NewsState> emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
    _pageController.animateToPage(event.currentIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  FutureOr<void> _updateLanguaje(
      _UpdateLanguaje event, Emitter<NewsState> emit) {
    if (event.newlanguaje == 'es') {
      S.load(const Locale('es'));
      emit(state.copyWith(currentLocale: Intl.getCurrentLocale()));
    } else if (event.newlanguaje == 'en') {
      S.load(const Locale('en'));
      emit(state.copyWith(currentLocale: Intl.getCurrentLocale()));
    }
  }
}
