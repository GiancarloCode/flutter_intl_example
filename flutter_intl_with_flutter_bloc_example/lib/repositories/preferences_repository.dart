import 'dart:ui';

abstract class PreferencesRepository {
  Future<void> saveLocale(Locale locale);

  Future<Locale> get locale;
}
