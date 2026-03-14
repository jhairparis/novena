import 'package:flutter/material.dart';

/// A wrapper widget that provides enhanced back navigation support
/// compatible with Android's predictive back gesture.
/// 
/// IMPORTANTE: Este wrapper debe usarse SOLO cuando necesites lógica
/// especial de back (ej: mostrar diálogos de confirmación, limpiar estado).
/// Para navegación normal, NO uses PopScope - deja que Flutter maneje
/// la navegación automáticamente para que funcione el predictive back.
/// 
/// Para predictive back funcione correctamente:
/// - El MaterialApp debe tener PredictiveBackPageTransitionsBuilder configurado
/// - AndroidManifest.xml debe tener android:enableOnBackInvokedCallback="true"
/// - Flutter 3.14+ es requerido
/// - No usar PopScope en rutas normales (reading, player, etc.)
class PredictiveBackWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onBackPressed;
  final bool enablePredictiveBack;
  final String? routeName;

  const PredictiveBackWrapper({
    super.key,
    required this.child,
    this.onBackPressed,
    this.enablePredictiveBack = true,
    this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    if (!enablePredictiveBack) {
      return child;
    }

    // NOTA: Este wrapper debe usarse SOLO para casos especiales 
    // como diálogos de confirmación. Para navegación normal,
    // NO usar PopScope - dejar que Flutter maneje automáticamente.
    // 
    // Para habilitar el predictive back gesture correctamente:
    // 1. canPop debe ser true para permitir la animación de preview
    // 2. La lógica se maneja en onPopInvokedWithResult después del pop
    // 3. No bloqueamos dinámicamente el pop para preservar la animación
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        // Si didPop es true, el pop ya ocurrió normalmente
        if (didPop && onBackPressed != null) {
          // Ejecutar callback personalizado después del pop exitoso
          onBackPressed!();
        }
        // Si didPop es false, el pop fue cancelado por otra razón
        // (ej: otra PopScope bloqueó el pop)
      },
      child: child,
    );
  }
}

/// Enhanced AppBar with better back button handling
class PredictiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final double toolbarHeight;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final double elevation;
  final bool centerTitle;

  const PredictiveAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.onBackPressed,
    this.toolbarHeight = kToolbarHeight,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.elevation = 0,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      actions: actions,
      toolbarHeight: toolbarHeight,
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading && Navigator.canPop(context)
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              tooltip: 'Regresar',
              icon: const Icon(Icons.arrow_back),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
