import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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
  }
  final GetNews _getNews;

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
}
