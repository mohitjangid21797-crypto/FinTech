import 'package:flutter/material.dart';
import 'package:loan_management_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _isSmsEnabled = false;
  String _twilioAccountSid = '';
  String _twilioAuthToken = '';
  String _twilioPhoneNumber = '';
  String _currentLanguage = 'English';

  bool get isDarkMode => _isDarkMode;
  bool get isSmsEnabled => _isSmsEnabled;
  String get twilioAccountSid => _twilioAccountSid;
  String get twilioAuthToken => _twilioAuthToken;
  String get twilioPhoneNumber => _twilioPhoneNumber;
  String get currentLanguage => _currentLanguage;

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isSmsEnabled = prefs.getBool('isSmsEnabled') ?? false;
    _twilioAccountSid = prefs.getString('twilioAccountSid') ?? '';
    _twilioAuthToken = prefs.getString('twilioAuthToken') ?? '';
    _twilioPhoneNumber = prefs.getString('twilioPhoneNumber') ?? '';
    _currentLanguage = prefs.getString('currentLanguage') ?? 'English';
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  Future<void> setSmsEnabled(bool enabled) async {
    _isSmsEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSmsEnabled', _isSmsEnabled);
    notifyListeners();
  }

  Future<void> setLanguage(String language, {BuildContext? context}) async {
    _currentLanguage = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentLanguage', language);

    if (context != null) {
      final localeProvider = Provider.of<LocaleProvider>(
        // ignore: use_build_context_synchronously
        context,
        listen: false,
      );
      await localeProvider.setLocale(language);
      // Trigger rebuild for UI
      WidgetsBinding.instance.addPostFrameCallback((_) {
        localeProvider.notifyListeners();
      });
    }

    notifyListeners();
  }

  Future<void> setTwilioCredentials({
    required String accountSid,
    required String authToken,
    required String phoneNumber,
  }) async {
    _twilioAccountSid = accountSid;
    _twilioAuthToken = authToken;
    _twilioPhoneNumber = phoneNumber;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('twilioAccountSid', _twilioAccountSid);
    await prefs.setString('twilioAuthToken', _twilioAuthToken);
    await prefs.setString('twilioPhoneNumber', _twilioPhoneNumber);
    notifyListeners();
  }
}
