import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/fondo_app.dart';
import '../widgets/rounded_bottom.dart';
import '../widgets/titulo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Stack(
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
        ));
  }
}
