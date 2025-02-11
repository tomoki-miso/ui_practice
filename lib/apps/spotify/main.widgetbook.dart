import 'package:flutter/material.dart';
import 'package:ui_practice/apps/spotify/main.widgetbook.directories.g.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook.material(
        directories: directories,
        addons: [
          MaterialThemeAddon(
            themes: [
              WidgetbookTheme(
                name: 'Dark',
                data: ThemeData(
                  scaffoldBackgroundColor: AppColor.spBlack,
                  primaryColor: Colors.black,
                  textTheme: const TextTheme(
                    bodyMedium: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              WidgetbookTheme(
                name: 'Light',
                data: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primaryColor: AppColor.spGreen,
                  textTheme: const TextTheme(
                    bodyMedium: TextStyle(color: AppColor.spBlack),
                  ),
                ),
              ),
            ],
          ),
          DeviceFrameAddon(
            devices: [
              Devices.ios.iPhoneSE,
              Devices.ios.iPhone13,
              Devices.ios.iPhone13ProMax,
              Devices.android.samsungGalaxyNote20,
            ],
          ),
        ],
      );
}
