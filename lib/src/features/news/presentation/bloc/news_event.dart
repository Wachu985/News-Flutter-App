part of 'news_bloc.dart';

abstract class NewsEvent {
  factory NewsEvent.transitionPage({required Params param}) =>
      _TransitionPage(param: param);
  factory NewsEvent.detailView({required New newDetail}) =>
      _DetailView(newDetail: newDetail);
  factory NewsEvent.updateIndex({required int currentIndex}) =>
      _UpdateIndex(currentIndex: currentIndex);
  factory NewsEvent.updateLanguaje({required String newlanguaje}) =>
      _UpdateLanguaje(newlanguaje: newlanguaje);
}

class _TransitionPage implements NewsEvent {
  const _TransitionPage({required this.param});
  final Params param;
}

class _DetailView implements NewsEvent {
  const _DetailView({required this.newDetail});
  final New newDetail;
}

class _UpdateIndex implements NewsEvent {
  const _UpdateIndex({required this.currentIndex});
  final int currentIndex;
}

class _UpdateLanguaje implements NewsEvent {
  const _UpdateLanguaje({required this.newlanguaje});
  final String newlanguaje;
}
