import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? baseStyle;
  final Color? textColor;
  final TextAlign? textAlign;

  const ThemedText({
    super.key,
    required this.text,
    this.baseStyle,
    this.textColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveColor = textColor ?? colorScheme.onSurface;

    return Text(
      text,
      textAlign: textAlign,
      style: (baseStyle ?? theme.textTheme.bodyLarge)?.copyWith(
        color: effectiveColor,
      ),
    );
  }
}

class ThemedTitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const ThemedTitle({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ThemedText(
      text: text,
      baseStyle: theme.textTheme.titleLarge,
      textColor: colorScheme.onSurface,
      textAlign: textAlign,
    );
  }
}

class ThemedSubtitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const ThemedSubtitle({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ThemedText(
      text: text,
      baseStyle: theme.textTheme.bodyLarge,
      textColor: colorScheme.onSurfaceVariant,
      textAlign: textAlign,
    );
  }
}
