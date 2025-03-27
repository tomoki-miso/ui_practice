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
    const MethodChannel methodChannel = MethodChannel('com.example.map');
    try {
      // メソッド名を'show'に変更（iOS側と一致させる）
      final result = await methodChannel.invokeMethod('showMap');
      debugPrint('Result from native view: $result');
    } on PlatformException catch (e) {
      debugPrint(
          'Error launching native screen: ${e.code}, ${e.message}, ${e.details}');
    }
  }
}
