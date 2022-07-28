import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/config/routes/app_routes.dart';
import 'package:flutter_news_app/src/config/theme/app_theme.dart';
import 'package:flutter_news_app/src/core/utils/constants.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}
