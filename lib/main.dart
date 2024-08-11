import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/menu.png'))),
            Text('قیمت بروز ارز'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icon.png'),
            )
          ],
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
