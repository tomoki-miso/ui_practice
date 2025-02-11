// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:ui_practice/apps/spotify/main.widgetbook.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) =>
      Widgetbook.material(directories: directories);
}
