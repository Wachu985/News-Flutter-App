import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/news_bloc.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Column(
          children: [
            FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(state.newDetail?.urlToImage ??
                    'https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg')),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                state.newDetail?.title ?? '',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                state.newDetail?.content ?? '',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(state.newDetail?.url ?? ''));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 54, 101, 1.0),
                  fixedSize: const Size(250, 60),
                ),
                child: Text(
                  S.of(context).tLeer,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
