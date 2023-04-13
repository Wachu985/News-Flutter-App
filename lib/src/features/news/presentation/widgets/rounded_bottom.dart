import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/core/utils/params.dart';
import 'package:news_project/src/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_project/src/features/news/presentation/screens/list_new_screen.dart';

class TableRoundedBottm extends StatelessWidget {
  const TableRoundedBottm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            RoundedBottom(
                color: Colors.purpleAccent,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.general.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.general.categoryIcon,
                text: CategoryType.general.categoryName),
            RoundedBottom(
                color: Colors.blue,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.business.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.business.categoryIcon,
                text: CategoryType.business.categoryName),
          ],
        ),
        TableRow(
          children: [
            RoundedBottom(
                color: Colors.pinkAccent,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category:
                                  CategoryType.entertainment.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.entertainment.categoryIcon,
                text: CategoryType.entertainment.categoryName),
            RoundedBottom(
                color: Colors.orange,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.health.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.health.categoryIcon,
                text: CategoryType.health.categoryName)
          ],
        ),
        TableRow(
          children: [
            RoundedBottom(
                color: Colors.blueAccent,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.science.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.science.categoryIcon,
                text: CategoryType.science.categoryName),
            RoundedBottom(
                color: Colors.green,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.sports.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.sports.categoryIcon,
                text: CategoryType.sports.categoryName)
          ],
        ),
        TableRow(
          children: [
            RoundedBottom(
                color: Colors.red,
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(
                      NewsEvent.transitionPage(
                          param: Params(
                              languaje: 'es',
                              category: CategoryType.technology.categoryName)));
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ListNewScreen(),
                      ));
                },
                icono: CategoryType.technology.categoryIcon,
                text: CategoryType.technology.categoryName),
            RoundedBottom(
                color: Colors.teal,
                onPressed: () {},
                icono: Icons.help_outline,
                text: 'Help')
          ],
        ),
      ],
    );
  }
}

class RoundedBottom extends StatelessWidget {
  const RoundedBottom(
      {super.key,
      required this.color,
      required this.icono,
      required this.text,
      required this.onPressed});

  final Color color;
  final IconData icono;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 180.0,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(
                icono,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
