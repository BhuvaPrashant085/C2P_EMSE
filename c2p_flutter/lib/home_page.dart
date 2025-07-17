import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendSOSPage extends StatelessWidget {
  final String myNumber = '951239964';
  final String trustedContact = '7016073980';

  void _sendSOSOnWhatsApp(BuildContext context) async {
    final message =
        '🚨 *SOS Alert*\n\nThis is an emergency message from $myNumber.\nPlease respond or provide help immediately!';
    final url = 'https://wa.me/91$trustedContact?text=${Uri.encodeComponent(message)}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency SOS'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.warning, color: Colors.white),
          label: Text('Send SOS on WhatsApp'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () => _sendSOSOnWhatsApp(context),
        ),
      ),
    );
  }
}
