import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class VibratePresetView extends StatefulWidget {
  const VibratePresetView({super.key});

  static const routeName = '/vibrate_preset';

  @override
  VibratePresetViewState createState() => VibratePresetViewState();
}

class VibratePresetViewState extends State<VibratePresetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VibrationPresetテスター'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('VibrationPreset.singleShortBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.doubleBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.tripleBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.tripleBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.longAlarmBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.longAlarmBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.pulseWave'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.pulseWave);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.progressiveBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.progressiveBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.rhythmicBuzz'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.rhythmicBuzz);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.gentleReminder'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.gentleReminder);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.quickSuccessAlert'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.zigZagAlert'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.zigZagAlert);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.softPulse'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.softPulse);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.emergencyAlert'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.emergencyAlert);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.heartbeatVibration'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.heartbeatVibration);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.countdownTimerAlert'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.countdownTimerAlert);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.rapidTapFeedback'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.rapidTapFeedback);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.dramaticNotification'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
              },
            ),
            ListTile(
              title: const Text('VibrationPreset.urgentBuzzWave'),
              onTap: () {
                Vibration.vibrate(preset: VibrationPreset.urgentBuzzWave);
              },
            ),
          ],
        ),
      ),
    );
  }
}
