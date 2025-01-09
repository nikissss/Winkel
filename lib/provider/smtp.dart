import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> sendEmail({
  required String recipientEmail,
  required String subject,
  required String body,
}) async {
  // Your SMTP server credentials
  final String username = 'nikkikayastha0@gmail.com';
  final String password =
      'hdjz zure vrvz ajvt'; // Use an App Password for Gmail

  // Configure SMTP server (for Gmail in this case)
  final smtpServer =
      gmail(username, password); // For other providers, use their SMTP servers

  // Create the email message
  final message = Message()
    ..from = Address(username, 'Winkel') // Sender name and email
    ..recipients.add(recipientEmail) // Recipient email
    ..subject = subject // Email subject
    ..text = body; // Email body (plain text)

  try {
    // Send the email
    final sendReport = await send(message, smtpServer);
    print('Email sent successfully: $sendReport');
  } on MailerException catch (e) {
    print('Email failed to send: $e');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  } catch (e) {
    print('Unexpected error: $e');
  }
}
