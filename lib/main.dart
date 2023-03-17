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
        Locale('es'), // Spanish
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
  final _locale = ValueNotifier(Locales.en);

  @override
  Widget build(BuildContext context) {
    final titleBgColor = Theme.of(context).colorScheme.inversePrimary;

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
            child: ValueListenableBuilder(
              valueListenable: _locale,
              builder: (_, locale, ___) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: LocalePicker(locale: _locale),
                  ),
                  Expanded(child: HomeContent(locale)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LocalePicker extends StatelessWidget {
  const LocalePicker({super.key, required this.locale});

  final ValueNotifier<Locales> locale;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;
    return DropdownButton<Locales>(
      focusColor: bgColor,
      items: Locales.values
          .map(
            (l) => DropdownMenuItem(
              value: l,
              child: Text(l.displayName),
            ),
          )
          .toList(),
      onChanged: (l) => locale.value = l!,
      value: locale.value,
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent(this.locale, {super.key});
  final Locales locale;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: 330,
            child: Markdown(
              selectable: true,
              data: Texts.mainIntro.text[locale]!,
              onTapLink: (text, url, title) async {
                if (url != null) await launchUrl(Uri.parse(url));
              },
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: OutlinedButton(
              onPressed: () =>
                  launchUrl(Uri.parse(Links.learningMaterials.link)),
              child: Text(Texts.learningMaterials.text[locale]!),
            ),
          ),
        )
      ],
    );
  }
}
