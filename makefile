clean:
	flutter clean

get:
	flutter pub get

generate: 
	flutter pub run build_runner build --delete-conflicting-outputs

run-devices: 
	flutter run --flavor dozuki lib/main.dart -d all