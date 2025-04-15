import 'package:flutter/material.dart';
import 'package:note/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'home_page/presentation/pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
