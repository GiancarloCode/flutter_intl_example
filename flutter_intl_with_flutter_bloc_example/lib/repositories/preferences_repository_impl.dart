import 'dart:ui';
import 'package:flutter_intl_example/repositories/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  static const String _localeLanguageCodeKey = 'localeLanguageCode';
  static const String _localeScriptCodeKey = 'localeScriptCode';
  static const String _localeCountryCodeKey = 'localeCountryCode';

  @override
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_localeLanguageCodeKey, locale?.languageCode);
    await prefs.setString(_localeScriptCodeKey, locale?.scriptCode);
    await prefs.setString(_localeCountryCodeKey, locale?.countryCode);
  }

  @override
  Future<Locale> get locale async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString(_localeLanguageCodeKey);
    final scriptCode = prefs.getString(_localeScriptCodeKey);
    final countryCode = prefs.getString(_localeCountryCodeKey);

    if (languageCode != null) {
      return Locale.fromSubtags(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
    }

    return null;
  }
}
