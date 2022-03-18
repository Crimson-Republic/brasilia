import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    Get.put(ColorController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Opacité Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fonts.manrope,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
    );
  }
}
