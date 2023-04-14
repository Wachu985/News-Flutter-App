import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/fondo_app.dart';
import '../widgets/titulo_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const FondoApp(),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TituloWidget(
              title: S.of(context).tSettings,
              subtitle: S.of(context).tSubSettings,
            ),
            const SettingsButtom(),
          ]),
        )
      ],
    ));
  }
}

class SettingsButtom extends StatelessWidget {
  const SettingsButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Text(
        "text",
      ),
    );
  }
}
