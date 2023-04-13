import 'package:flutter/material.dart';
import 'package:news_project/src/core/inyection/dependency_inyection.dart';

import 'src/app.dart';

void main() async {
  await DependencyInyection.init();
  runApp(const MyApp());
}
