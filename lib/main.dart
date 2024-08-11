import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          actions: [
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/images/icon.png'),
            ),
            Text(
              'قیمت بروز سکه و ارز',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/menu.png'))),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/info_icon.png',
                      width: 18,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'نرخ ارز آزاد چیست؟ ',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Color.fromARGB(255, 130, 130, 130)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'نام آزاد ارز',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'قیمت',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'تغییر',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 700,
                    child: ListView.builder(
                        itemCount: 30,
                        itemBuilder: (BuildContext context, int count) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(2, 8, 2, 0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        blurRadius: 1.0, color: Colors.grey),
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'دلار',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    '60000',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text('+5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ));
  }
}
