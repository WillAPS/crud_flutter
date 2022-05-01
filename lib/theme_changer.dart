import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Brightness brightness, IconData icon) builder;
  final Brightness defaultBrightness;
  final IconData defaultIcon;
  ThemeBuilder({required this.builder, required this.defaultBrightness, required this.defaultIcon});

  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();

  static _ThemeBuilderState? of(BuildContext context)
  {
    return context.findAncestorStateOfType<_ThemeBuilderState>();
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  late Brightness _brightness;
  late IconData _icon;

  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _icon = widget.defaultIcon;
  }

  void changeTheme() {
    setState(() {
      _brightness = _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
      _icon = _icon == Icons.light_mode ? Icons.dark_mode : Icons.light_mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness, _icon);
  }
}