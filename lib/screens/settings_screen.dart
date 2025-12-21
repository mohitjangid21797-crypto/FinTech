import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _accountSidController = TextEditingController();
  final TextEditingController _authTokenController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final settings = Provider.of<SettingsProvider>(context, listen: false);
      _accountSidController.text = settings.twilioAccountSid;
      _authTokenController.text = settings.twilioAuthToken;
      _phoneNumberController.text = settings.twilioPhoneNumber;
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _accountSidController.dispose();
    _authTokenController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _saveSmsSettings() {
    final settings = Provider.of<SettingsProvider>(context, listen: false);
    settings.setTwilioCredentials(
      accountSid: _accountSidController.text.trim(),
      authToken: _authTokenController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SMS settings saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Settings Card
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.palette,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Appearance',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer<SettingsProvider>(
                      builder: (context, settings, child) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(
                            settings.isDarkMode
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: const Text('Dark Mode'),
                          subtitle: const Text(
                            'Toggle between light and dark theme',
                          ),
                          trailing: Switch(
                            value: settings.isDarkMode,
                            onChanged: (value) {
                              settings.toggleTheme();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // SMS Settings Card
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sms,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'SMS Notifications',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer<SettingsProvider>(
                      builder: (context, settings, child) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(
                            Icons.notifications_active,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: const Text('Enable SMS Notifications'),
                          subtitle: const Text(
                            'Send SMS for EMI payments and reminders',
                          ),
                          trailing: Switch(
                            value: settings.isSmsEnabled,
                            onChanged: (value) {
                              settings.setSmsEnabled(value);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Twilio Configuration Card
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings_cell,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Twilio Configuration',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _accountSidController,
                      decoration: const InputDecoration(
                        labelText: 'Account SID',
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _authTokenController,
                      decoration: const InputDecoration(
                        labelText: 'Auth Token',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        hintText: '+1234567890',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _saveSmsSettings,
                        icon: const Icon(Icons.save),
                        label: const Text('Save SMS Settings'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
