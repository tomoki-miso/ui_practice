.PHONY: setup
setup:
	fvm flutter clean
	fvm flutter pub get

br:
	flutter pub run build_runner build --delete-conflicting-outputs