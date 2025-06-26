# library_tester

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/to/state-management-sample).

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## iOS ビルドエラーの解決方法

`ld: framework 'Pods_Runner' not found` エラーが発生した場合は、以下の手順で解決してください：

1. プロジェクトディレクトリで以下のコマンドを実行します：
   ```bash
   cd ios
   pod deintegrate
   pod install
   ```

2. それでも解決しない場合は、以下も試してください：
   ```bash
   flutter clean
   cd ios
   pod deintegrate
   rm -rf Pods Podfile.lock
   pod install
   cd ..
   flutter run
   ```

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/to/resolution-aware-images).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter apps](https://flutter.dev/to/internationalization).
