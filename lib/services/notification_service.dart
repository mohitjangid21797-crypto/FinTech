import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/settings_provider.dart';

class NotificationService {
  final BuildContext context;

  NotificationService(this.context);

  // Send SMS notification using Twilio API
  Future<void> sendSMS(String phoneNumber, String message) async {
    final settings = Provider.of<SettingsProvider>(context, listen: false);

    if (!settings.isSmsEnabled) {
      // SMS notifications are disabled
      return;
    }

    if (settings.twilioAccountSid.isEmpty ||
        settings.twilioAuthToken.isEmpty ||
        settings.twilioPhoneNumber.isEmpty) {
      throw Exception('Twilio credentials not configured');
    }

    try {
      final String credentials = base64Encode(
        utf8.encode('${settings.twilioAccountSid}:${settings.twilioAuthToken}'),
      );

      final String apiUrl =
          'https://api.twilio.com/2010-04-01/Accounts/${settings.twilioAccountSid}/Messages.json';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Basic $credentials',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'From': settings.twilioPhoneNumber,
          'To': phoneNumber,
          'Body': message,
        },
      );

      if (response.statusCode == 201) {
        // SMS sent successfully
        // print('SMS sent successfully to $phoneNumber');
      } else {
        // Handle error
        // print('Failed to send SMS: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to send SMS: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error
      // print('Error sending SMS: $e');
      throw Exception('Error sending SMS: $e');
    }
  }

  // Send payment reminder
  Future<void> sendPaymentReminder(
    String phoneNumber,
    double amount,
    DateTime dueDate,
  ) async {
    final message =
        'Reminder: Your EMI payment of ₹${amount.toStringAsFixed(2)} is due on ${dueDate.toLocal()}.';
    await sendSMS(phoneNumber, message);
  }

  // Send loan approval notification
  Future<void> sendLoanApproval(String phoneNumber, String loanId) async {
    final message = 'Congratulations! Your loan $loanId has been approved.';
    await sendSMS(phoneNumber, message);
  }

  // Send overdue payment notification
  Future<void> sendOverdueNotification(
    String phoneNumber,
    double amount,
  ) async {
    final message =
        'Alert: Your EMI payment of ₹${amount.toStringAsFixed(2)} is overdue. Please pay immediately.';
    await sendSMS(phoneNumber, message);
  }

  // Send EMI payment confirmation
  Future<void> sendEMIPaymentConfirmation(
    String phoneNumber,
    String customerName,
    double amount,
  ) async {
    final message =
        'Dear $customerName\n(Congratulations Your EMI of amount ₹${amount.toStringAsFixed(2)} has been successfully received)';
    await sendSMS(phoneNumber, message);
  }
}
