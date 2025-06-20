# Novena de Aguinaldos

Una aplicación móvil para celebrar la tradicional Novena de Aguinaldos en familia, desarrollada en Flutter con Material Design 3.

## Propósito

Esta aplicación fue creada para preservar y facilitar la tradición colombiana de la Novena de Aguinaldos, permitiendo a las familias rezar juntas durante los nueve días previos a la Navidad, desde el 16 hasta el 24 de diciembre.

## Licencia

Este proyecto está licenciado bajo **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

### ¿Qué significa esto?

- ❌ **No puedes**: Usar con fines comerciales
- 📋 **Variantes**: Deben usar la misma licencia
- ✅ **Puedes**: Usar, modificar y distribuir el código
- ✅ **Debes**: Dar crédito al autor original

### Atribución Requerida

```text
Novena de Aguinaldos © 2025 por Jhair Paris
Licenciado bajo CC BY-NC-SA 4.0
```

Para el texto completo de la licencia, consulta el archivo [LICENSE.md](./LICENSE.md).

Más información: <https://creativecommons.org/licenses/by-nc-sa/4.0/>

---

### 🤝 Contribuciones

Las contribuciones son bienvenidas siempre que respeten el espíritu de preservar la tradición de la Novena de Aguinaldos.

---

## Tecnologías Utilizadas

### Framework y Lenguaje

- **Flutter**: Framework multiplataforma
- **Dart**: Lenguaje de programación

## Características Técnicas

### Diseño y UI/UX

- **Material Design 3**: Interfaz moderna y atractiva
- **Dynamic Color**: Colores adaptativos del sistema
- **Tema claro y oscuro**: Cambio automático según preferencias del sistema
- **Color principal**: #DF2A57 (rojo navideño)

### Funcionalidades

- **Navegación intuitiva**: Fácil acceso a todas las secciones
- **Reproducción de audio**: Player integrado con controles completos
- **Carga de contenido dinámico**: Textos e imágenes desde servidor remoto
- **Imágenes en caché**: Optimización de carga con `cached_network_image`
- **Interfaz responsive**: Adaptada a diferentes tamaños de pantalla

### Arquitectura

- **Patrón MVC**: Modelos, vistas y componentes separados
- **Gestión de estado**: StatelessWidget para componentes reactivos
- **HTTP requests**: Carga de contenido textual desde servidor
- **Manejo de errores**: Fallbacks para contenido no disponible

## Instalación y Uso

### Pasos de instalación

```bash
git clone https://github.com/jhairparis/novena && cd novena

flutter pub get

flutter run
```

### Compilación

```bash
flutter build apk
```
