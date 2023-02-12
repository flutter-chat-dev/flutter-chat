enum Locales {
  en('English'),
  ru('Русский'),
  ;

  const Locales(this.displayName);

  final String displayName;
}

enum Texts {
  mainIntro({
    Locales.en: '''
[Flutter](http://flutter.dev) is a beautiful technology for building beautiful applications.

We are a community of people who want Flutter to empower those making this world better, by enabling them to quickly create beautiful web and mobile applications.

We welcome:
* Career explorers, who want to learn and use Flutter
* Volunteers, who would like to support the explorers in understanding Flutter, online or in classroom

We speak English and Russian and want to extend the list of languages.

We are located in the US, Redmond WA and want to extend the list of locations.

Required skills: basic English reading.

Join us at Facebook group [Flutter Chat](https://www.facebook.com/groups/676660377543846/) to participate.
''',
    Locales.ru: '''
hi
''',
  });

  const Texts(this.text);

  final Map<Locales, String> text;
}
