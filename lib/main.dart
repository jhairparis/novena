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
      final effectiveLightColorScheme =
          lightColorScheme ?? _defaultLightColorScheme;
      final effectiveDarkColorScheme =
          darkColorScheme ?? _defaultDarkColorScheme;
      return MaterialApp(
        title: 'Novena de aguinaldos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: effectiveLightColorScheme,
          useMaterial3: true,
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: effectiveLightColorScheme.onSurface,
                displayColor: effectiveLightColorScheme.onSurface,
              ),
          cardTheme: CardThemeData(
            color: effectiveLightColorScheme.surface,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: effectiveDarkColorScheme,
          useMaterial3: true,
          textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: effectiveDarkColorScheme.onSurface,
                displayColor: effectiveDarkColorScheme.onSurface,
              ),
          cardTheme: CardThemeData(
            color: effectiveDarkColorScheme.surface,
          ),
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      );
    });
  }
}
