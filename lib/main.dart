import 'package:slicing_ui_one/core/theme/them.dart';
import 'package:slicing_ui_one/state_util.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: MainTheme.getTheme(),

      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      //home: IntroView(),
    );
  }
}
