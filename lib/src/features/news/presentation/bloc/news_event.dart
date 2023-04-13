part of 'news_bloc.dart';

abstract class NewsEvent {
  factory NewsEvent.transitionPage({required Params param}) =>
      _TransitionPage(param: param);
  factory NewsEvent.detailView({required New newDetail}) =>
      _DetailView(newDetail: newDetail);
}

class _TransitionPage implements NewsEvent {
  const _TransitionPage({required this.param});
  final Params param;
}

class _DetailView implements NewsEvent {
  const _DetailView({required this.newDetail});
  final New newDetail;
}
