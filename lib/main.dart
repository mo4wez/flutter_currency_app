import 'package:currency_app/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;

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
        textTheme: const TextTheme(
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
          labelMedium: TextStyle(
            color: Colors.red,
            fontSize: 13,
          ),
          labelLarge: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Currency> currencyList = [];

  Future _getCurrencyData(BuildContext context) async {
    var url =
        'https://sasansafari.com/flutter/api.php?access_key=flutter123456';
    var response = await http.get(Uri.parse(url));

    if (currencyList.isEmpty) {
      if (response.statusCode == 200) {
        _showSnackBar(context, 'بروزرسانی موفقیت آمیز بود.');
        List jsonArray = convert.jsonDecode(response.body);
        if (jsonArray.isNotEmpty) {
          for (int i = 0; i < jsonArray.length; i++) {
            setState(() {
              currencyList.add(Currency(
                  id: jsonArray[i]["id"],
                  title: jsonArray[i]["title"],
                  price: jsonArray[i]["price"],
                  changes: jsonArray[i]["changes"],
                  status: jsonArray[i]["status"]));
            });
          }
        }
      }
    }
    return response;
  }

  @override
  void initState() {
    super.initState();
    _getCurrencyData(context);
    developer.log('initState', name: 'Widget Life Cycle');
  }

  @override
  Widget build(BuildContext context) {
    developer.log('build', name: 'Widget Life Cycle');
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
                    height: 510,
                    child: futureBuilderMethod(context)),
                Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 232, 232),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextButton.icon(
                              onPressed: () {
                                currencyList.clear();
                                futureBuilderMethod(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.refresh,
                              ),
                              label: Text(
                                'به روز رسانی',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              style: const ButtonStyle(
                                iconColor: WidgetStatePropertyAll(Colors.black),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 202, 193, 255)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            'آخرین بروزرسانی در ${_updatedAt()}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.black54, fontSize: 18),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  FutureBuilder<dynamic> futureBuilderMethod(BuildContext context) {
    return FutureBuilder(
      future: _getCurrencyData(context),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                itemCount: currencyList.length,
                itemBuilder: (BuildContext context, int position) {
                  return CurrencyItemWidget(
                    position,
                    currencyList,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 9 == 0) {
                    return AdvertisementWidget();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

String _updatedAt() {
  return '21:50';
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  ));
}

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(1000)),
        child: Center(
          child: Text(
            'تبلیغات',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}

class CurrencyItemWidget extends StatelessWidget {
  final int position;
  final List<Currency> currency;

  CurrencyItemWidget(this.position, this.currency, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 1.0, color: Colors.grey),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              currency[position].title!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              currency[position].price!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
                textDirection: TextDirection.ltr,
                currency[position].changes!,
                style: currency[position].status == 'n'
                    ? Theme.of(context).textTheme.labelMedium
                    : Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
