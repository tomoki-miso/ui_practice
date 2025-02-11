.PHONY: setup
setup:
	fvm flutter clean
	fvm flutter pub get

br:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

run widgetbook:
	fvm flutter run -d chrome --web-renderer html -t  lib/apps/spotify/main.widgetbook.dart