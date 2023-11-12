import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/providers/provider.dart';
import 'package:task_1/shared/styles/mytheme.dart';
import 'package:task_1/ui/screen_1/home/s1_home_widget.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        HomeWidget.routeName:(context) => const HomeWidget(),
      },

      initialRoute:  HomeWidget.routeName ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

