import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/news_bloc.dart';
import '../widgets/fondo_app.dart';
import '../widgets/new_widget.dart';
import '../widgets/titulo_widget.dart';

class ListNewScreen extends StatelessWidget {
  const ListNewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const FondoApp(),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return TituloWidget(
              title: S.of(context).tNoticias(state.param?.category ?? ''),
              subtitle: S.of(context).tNoticiaC(state.param?.category ?? ''),
            );
          },
        ),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.news.length,
                  itemBuilder: (context, index) =>
                      NewWidget(newA: state.news[index]),
                ),
              );
              // return Column(children: [
              // ]);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    ));
  }
}
