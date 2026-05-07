import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/language_codes.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  String? _getCodeFromName(String name) {
    try {
      return languageCodes[name];
    } catch (e) {
      debugPrint('Language code not found for: $name');
      return null;
    }
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('localeLanguageName') ?? 'English';
    final code = _getCodeFromName(savedName) ?? 'en';
    _locale = Locale(code);
    notifyListeners();
  }

  Future<void> setLocale(String languageName) async {
    final code = _getCodeFromName(languageName) ?? 'en';
    _locale = Locale(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('localeLanguageName', languageName);
    await prefs.setString('localeLanguageCode', code);
    notifyListeners();
  }
}
