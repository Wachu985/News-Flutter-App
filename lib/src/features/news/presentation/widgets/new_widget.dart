import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_project/src/features/news/presentation/screens/detail_new_screen.dart';

import '../../domain/entities/news.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.newA});
  final New newA;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NewsBloc>(context)
            .add(NewsEvent.detailView(newDetail: newA));
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const DetailNewScreen(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 10)
              ]),
          child: Column(
            children: [
              newA.urlToImage != 'Not Found'
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: FadeInImage(
                        image: NetworkImage(
                          newA.urlToImage,
                        ),
                        placeholder: const AssetImage('assets/loading.gif'),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset('assets/img.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newA.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(newA.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
