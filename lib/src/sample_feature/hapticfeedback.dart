import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HapticfeedbackView extends StatefulWidget {
  const HapticfeedbackView({super.key});

  static const routeName = '/hapicfeedback';

  @override
  HapticfeedbackViewState createState() => HapticfeedbackViewState();
}

class HapticfeedbackViewState extends State<HapticfeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HapticFeedbackテスター'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('HapticFeedback.lightImpact'),
              onTap: () {
                HapticFeedback.lightImpact();
              },
            ),
            ListTile(
              title: const Text('HapticFeedback.mediumImpact'),
              onTap: () {
                HapticFeedback.mediumImpact();
              },
            ),
            ListTile(
              title: const Text('HapticFeedback.heavyImpact'),
              onTap: () {
                HapticFeedback.heavyImpact();
              },
            ),
            ListTile(
              title: const Text('HapticFeedback.selectionClick'),
              onTap: () {
                HapticFeedback.selectionClick();
              },
            ),
            ListTile(
              title: const Text('HapticFeedback.vibrate'),
              onTap: () {
                HapticFeedback.vibrate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
