import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locales _locale = Locales.en;

  @override
  Widget build(BuildContext context) {
    final titleBgColor = Theme.of(context).colorScheme.inversePrimary;
    final bgColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: titleBgColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 700,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: DropdownButton<Locales>(
                    focusColor: bgColor,
                    items: Locales.values
                        .map((l) => DropdownMenuItem(
                            value: l, child: Text(l.displayName)))
                        .toList(),
                    onChanged: (l) => setState(() {
                      _locale = l!;
                    }),
                    value: _locale,
                  ),
                ),
                Expanded(
                  child: Markdown(
                    data: Texts.mainIntro.text[_locale]!,
                    onTapLink: (text, url, title) async {
                      if (url != null) await launchUrl(Uri.parse(url));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
