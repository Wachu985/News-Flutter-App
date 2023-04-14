import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/features/news/presentation/bloc/news_bloc.dart';

import '../../../../../generated/l10n.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(55, 57, 84, 1.0),
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1.0),
          currentIndex: state.currentIndex,
          onTap: (value) {
            BlocProvider.of<NewsBloc>(context)
                .add(NewsEvent.updateIndex(currentIndex: value));
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.category_rounded,
                  size: 25.0,
                ),
                label: S.of(context).tCategoryB),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings_rounded,
                  size: 25.0,
                ),
                label: S.of(context).tSettingsB),
          ],
        );
      },
    );
  }
}
