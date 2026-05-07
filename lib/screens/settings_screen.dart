// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../l10n/app_localizations.dart';
import '../providers/settings_provider.dart';
import '../providers/backup_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings), elevation: 0),
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
                          l10n.appearance,
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
                          title: Text(l10n.darkMode),
                          subtitle: Text(l10n.darkModeToggleSubtitle),
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
                          l10n.smsNotifications,
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
                          title: Text(l10n.enableSmsNotifications),
                          subtitle: Text(l10n.smsToggleSubtitle),
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

            // Backup Settings Card
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
                          Icons.cloud_upload,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Google Drive Backup',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer<BackupProvider>(
                      builder: (context, backupProvider, child) {
                        final isBackupInProgress =
                            backupProvider.isBackupInProgress.value;
                        final uploadProgress =
                            backupProvider.uploadProgress.value;

                        return Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: isBackupInProgress
                                  ? null
                                  : () async {
                                      if (!mounted) return;
                                      try {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Backup started...'),
                                          ),
                                        );
                                        await backupProvider.backupData(
                                          context,
                                        );
                                      } catch (e) {
                                        if (mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '❌ Backup failed: $e',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                              icon: const Icon(Icons.backup),
                              label: Text(
                                isBackupInProgress
                                    ? 'Backing up...'
                                    : 'Backup to Google Drive',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),
                            if (isBackupInProgress) ...[
                              const SizedBox(height: 12),
                              LinearProgressIndicator(value: uploadProgress),
                            ],
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Consumer<BackupProvider>(
                      builder: (context, backupProvider, child) {
                        final isRestoreInProgress =
                            backupProvider.isRestoreInProgress.value;
                        final downloadProgress =
                            backupProvider.downloadProgress.value;

                        return Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: isRestoreInProgress
                                  ? null
                                  : () async {
                                      if (!mounted) return;
                                      try {
                                        final confirmed = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Restore Backup'),
                                            content: const Text(
                                              'This will overwrite your local data with Google Drive backup. Continue?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  false,
                                                ),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  true,
                                                ),
                                                child: const Text('Restore'),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (confirmed != true) return;

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Restore started...'),
                                          ),
                                        );

                                        await backupProvider.restoreData(
                                          context,
                                        );
                                      } catch (e) {
                                        if (mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '❌ Restore failed: $e',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                              icon: const Icon(Icons.cloud_download),
                              label: Text(
                                isRestoreInProgress
                                    ? 'Restoring...'
                                    : 'Restore from Google Drive',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: Colors.orange,
                              ),
                            ),
                            if (isRestoreInProgress) ...[
                              const SizedBox(height: 12),
                              LinearProgressIndicator(value: downloadProgress),
                            ],
                          ],
                        );
                      },
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
