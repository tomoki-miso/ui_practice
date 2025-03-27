import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Flutter & Native Integration')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async => launchNativeScreen(),
                child: const Text('Launch Native Screen'),
              ),
            ],
          ),
        ),
      );

  Future<void> launchNativeScreen() async {
    const methodChannel = MethodChannel('com.example.map');

    final staffList = [
      {
        'name': '田中',
        'latitude': 35.6895,
        'longitude': 139.6917,
        'imageUrl': '',
      },
      {
        'name': '佐藤',
        'latitude': 34.6937,
        'longitude': 135.5023,
        'imageUrl': '',
      },
    ];

    try {
      final result = await methodChannel.invokeMethod('showMap', {
        'staffList': staffList,
      });
      debugPrint('Result from native view: $result');
    } on PlatformException catch (e) {
      debugPrint(
        'Error launching native screen: ${e.code}, ${e.message}, ${e.details}',
      );
    }
  }
}
