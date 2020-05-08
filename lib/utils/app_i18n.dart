import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SpacedAppLocalizations {
  SpacedAppLocalizations(this.locale);

  final Locale locale;

  static SpacedAppLocalizations of(BuildContext context) {
    return Localizations.of<SpacedAppLocalizations>(context, SpacedAppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}


class SpacedAppLocalizationsDelegate extends LocalizationsDelegate<SpacedAppLocalizations> {
  const SpacedAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<SpacedAppLocalizations> load(Locale locale) {
    return SynchronousFuture<SpacedAppLocalizations>(SpacedAppLocalizations(locale));
  }

  @override
  bool shouldReload(SpacedAppLocalizationsDelegate old) => false;
}

