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
      final resultText = await channel.invokeMethod('getHello');
      debugPrint(resultText);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async => getHello(),
              child: const Text('getHello'),
            ),
          ],
        ),
      ),
    );
  }
}
