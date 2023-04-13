part of 'news_bloc.dart';

enum NewStatus { initial, loading, success, error }

class NewsState extends Equatable {
  const NewsState(
      {this.msgError = '',
      this.status = NewStatus.initial,
      this.news = const [],
      this.param,
      this.newDetail});
  final String msgError;
  final NewStatus status;
  final List<New> news;
  final Params? param;
  final New? newDetail;

  factory NewsState.initialState() => const NewsState();

  NewsState copyWith(
          {String? msgError,
          NewStatus? status,
          List<New>? news,
          Params? param,
          New? newDetail}) =>
      NewsState(
          msgError: msgError ?? this.msgError,
          status: status ?? this.status,
          news: news ?? this.news,
          param: param ?? this.param,
          newDetail: newDetail ?? this.newDetail);

  @override
  List<Object> get props => [
        msgError,
        status,
        news,
        param ??
            Params(languaje: 'es', category: CategoryType.general.categoryName),
        newDetail ?? ''
      ];
}

extension NewsStateExtension on NewsState {
  bool get isLoading => status == NewStatus.loading;
  bool get isSuccess => status == NewStatus.success;
  bool get isError => status == NewStatus.error;
}
