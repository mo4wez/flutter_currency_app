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
              const SizedBox(
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('نرخ ارز آزاد چیست؟ '),
                    const SizedBox(width: 8),
                    Image.asset('assets/images/info_icon.png'),
                  ],
                ),
                Text(
                  ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          )),
    );
  }
}
