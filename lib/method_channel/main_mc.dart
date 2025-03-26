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
  Widget build(BuildContext context) {
    Future<void> getHello() async {
      const channel = MethodChannel('Channel');
      try {
        final resultText = await channel.invokeMethod('getHello');
        debugPrint(resultText);
      } on PlatformException catch (e) {
        debugPrint('Error calling getHello: ${e.code}, ${e.message}');
      }
    }

    Future<void> launchNativeScreen() async {
      const MethodChannel methodChannel = MethodChannel('com.example.show');
      try {
        // メソッド名を'show'に変更（iOS側と一致させる）
        final String result =
            await methodChannel.invokeMethod('show', 'これはFlutterからのパラメータです'); //ここのMethod名が
        debugPrint('Result from native view: $result');
      } on PlatformException catch (e) {
        debugPrint(
            'Error launching native screen: ${e.code}, ${e.message}, ${e.details}');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter & Native Integration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async => getHello(),
              child: const Text('getHello'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => launchNativeScreen(),
              child: const Text('Launch Native Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
