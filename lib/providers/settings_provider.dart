import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _isSmsEnabled = false;
  String _twilioAccountSid = '';
  String _twilioAuthToken = '';
  String _twilioPhoneNumber = '';

  bool get isDarkMode => _isDarkMode;
  bool get isSmsEnabled => _isSmsEnabled;
  String get twilioAccountSid => _twilioAccountSid;
  String get twilioAuthToken => _twilioAuthToken;
  String get twilioPhoneNumber => _twilioPhoneNumber;

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();

  SettingsProvider() {
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isSmsEnabled = prefs.getBool('isSmsEnabled') ?? false;
    _twilioAccountSid = prefs.getString('twilioAccountSid') ?? '';
    _twilioAuthToken = prefs.getString('twilioAuthToken') ?? '';
    _twilioPhoneNumber = prefs.getString('twilioPhoneNumber') ?? '';
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  void setSmsEnabled(bool enabled) async {
    _isSmsEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSmsEnabled', _isSmsEnabled);
    notifyListeners();
  }

  void setTwilioCredentials({
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
