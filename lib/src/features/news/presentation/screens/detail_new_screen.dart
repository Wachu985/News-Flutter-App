import 'package:flutter/material.dart';

import '../widgets/detail_widget.dart';
import '../widgets/fondo_app.dart';

class DetailNewScreen extends StatelessWidget {
  const DetailNewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          FondoApp(
            box: false,
          ),
          DetailWidget()
        ],
      ),
    );
  }
}
