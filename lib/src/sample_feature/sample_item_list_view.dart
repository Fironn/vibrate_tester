import 'package:flutter/material.dart';
import 'package:library_tester/src/sample_feature/hapticfeedback.dart';
import 'package:library_tester/src/sample_feature/sample_item.dart';
import 'package:library_tester/src/sample_feature/vibrate_preset.dart';
import 'package:library_tester/src/sample_feature/vibrate_vibrate.dart';
import 'package:library_tester/src/settings/settings_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(1, 'Vibration.vibrateテスター', VibrateVibrateView.routeName),
      SampleItem(2, 'VibrationPresetテスター', VibratePresetView.routeName),
      SampleItem(3, 'HapticFeedbackテスター', HapticfeedbackView.routeName)
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('テスター'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.separated(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              enableFeedback: true,
              title: Text(item.title),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  item.routeName,
                );
              });
        },
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
