enum Locales {
  en('English'),
  ru('Русский'),
  ;

  const Locales(this.displayName);

  final String displayName;
}

const _linkToFlutter = "http://flutter.dev";
const _linkToGroup = "https://www.facebook.com/groups/676660377543846/";
const _linkToMaterials =
    "https://docs.google.com/document/d/1EYJ6F3FZCkvUOJ95-Q3u0HBEAONq6tPtlWFUFfdjhqU/edit?usp=sharing";

enum Texts {
  mainIntro({
    Locales.en: '''
[Flutter]($_linkToFlutter) is an elegant technology for building beautiful applications.

Flutter Chat is a community of people who want Flutter to empower those making this world better,
by enabling them to quickly create beautiful web and mobile applications.

We welcome:
* Career explorers, who want to learn and use Flutter, online or in classroom.
Required skills: basic English reading.
* Volunteers, who would like to support the explorers in understanding Flutter,
online or in classroom.

We speak English and Russian and want to extend the list of languages.

We are located in the US, Redmond WA and want to extend the list of locations.

Join us at Facebook group [Flutter Chat]($_linkToGroup) to participate.

[Learning Materials]($_linkToMaterials)
''',
    Locales.ru: '''
[Flutter]($_linkToFlutter) - это элегантная технология для создания красивых приложений.

Flutter Chat - это группа энтузиастов, хотящих, чтобы Flutter помогал делать мир лучше,
давая возможность быстро создавать качественные мобильные приложения и веб сайты.

Мы рады:
* Всем, кто хочет изучить Flutter для карьеры или бизнеса, удаленно или в классе. Требуемые навыки: базовое чтение на английском.
* Волонтерам, которые хотели бы помочь в освоении Flutter, удаленно или в классе.

Мы говорим на русском и английском и хотели бы расширить список языков.

Мы расположены в US, Redmond WA и хотели бы расширить список местоположений.

Присоединяйтесь к нашей Facebook группе [Flutter Chat]($_linkToGroup).

[Учебные материалы]($_linkToMaterials)
''',
  });

  const Texts(this.text);

  final Map<Locales, String> text;
}
