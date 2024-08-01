import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _seedColor = Color(0xFFDF2A57);

  static final _defaultLightColorScheme =
      ColorScheme.fromSeed(seedColor: _seedColor);

  static final _defaultDarkColorScheme =
      ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Novena de aguinaldos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      );
    });
  }
}
