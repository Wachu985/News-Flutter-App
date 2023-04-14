import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/features/news/presentation/bloc/news_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/fondo_app.dart';
import '../widgets/rounded_bottom.dart';
import '../widgets/titulo_widget.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: PageView(
          controller: BlocProvider.of<NewsBloc>(context).pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeWidget(), SettingsScreen()],
        ));
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const FondoApp(),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            TituloWidget(
              title: S.of(context).tTitle,
              subtitle: S.of(context).tSubtitle,
            ),
            const TableRoundedBottm()
          ]),
        )
      ],
    );
  }
}
