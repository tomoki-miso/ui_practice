.PHONY: setup
setup:
	flutter clean
	flutter pub get

br:
	flutter pub run build_runner build --delete-conflicting-outputs