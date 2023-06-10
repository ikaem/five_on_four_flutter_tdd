clean:
	flutter clean

get:
	flutter pub get

generate: 
	dart run build_runner build --delete-conflicting-outputs

run-devices: 
	flutter run --flavor dozuki lib/main.dart -d all

validate-deps:
	flutter pub run dependency_validator

upgrade-deps:
	flutter pub upgrade

functions-deploy:
	firebase deploy --only functions

generate-icons: 
	flutter pub run flutter_launcher_icons

build-prod:
	flutter build appbundle --flavor=production --target=lib/main_production.dart