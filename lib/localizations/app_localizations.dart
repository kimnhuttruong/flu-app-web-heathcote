import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedValues;

  Future<bool> load() async {
    // final selectedLanguage = (locale?.countryCode ?? locale?.languageCode ?? 'GB').toLowerCase();
    String jsonStringValues = await rootBundle.loadString('assets/lang/en.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localization = AppLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
