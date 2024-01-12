import 'package:flutter/material.dart';
import 'dart:async' show Future;

class Styles {
  final TextStyle _textStyleHeading1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  final TextStyle _textStyleHeading2 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );
  final TextStyle _textStyleHeading3 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  final TextStyle _textStyleHeading4 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  final TextStyle _textStyleHeading5 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  final TextStyle _textStyleHeading6 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final TextStyle _textStyleSubtitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  final TextStyle _textStyleSubtitle2 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  TextStyle get heading1 => _textStyleHeading1;
  TextStyle get heading2 => _textStyleHeading2;
  TextStyle get heading3 => _textStyleHeading3;
  TextStyle get heading4 => _textStyleHeading4;
  TextStyle get heading5 => _textStyleHeading5;
  TextStyle get heading6 => _textStyleHeading6;

  TextStyle get subtitle => _textStyleSubtitle;
  TextStyle get subtitle2 => _textStyleSubtitle2;

  Future<String> loadText(BuildContext context, String source) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/txt/$source.txt');
  }
}
