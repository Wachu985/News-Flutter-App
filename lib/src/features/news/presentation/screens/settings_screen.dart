import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/news_bloc.dart';
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
    final List<DropdownMenuItem> listOpciones = <DropdownMenuItem>[
      const DropdownMenuItem(
        value: "es",
        child: Text('Spanish'),
      ),
      const DropdownMenuItem(
        value: "en",
        child: Text('English'),
      ),
    ];
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        print(state.currentLocale);
        return Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                S.of(context).tCambiarIdioma,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              DropdownButton(
                value: state.currentLocale,
                items: listOpciones,
                onChanged: (value) {
                  BlocProvider.of<NewsBloc>(context)
                      .add(NewsEvent.updateLanguaje(newlanguaje: value));
                },
                dropdownColor: Colors.blueGrey,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
