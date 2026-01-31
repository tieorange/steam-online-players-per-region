.PHONY: clean format get gen run test build-web

clean:
	flutter clean

format:
	dart format lib test

get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

run:
	flutter run -d chrome

run-macos:
	flutter run -d macos


test:
	flutter test

analyze:
	flutter analyze


build-web:
	flutter build web --release

build-web-optimized:
	flutter build web --release --pwa-strategy=offline-first --wasm

deploy-web:
	npx vercel --prod

fix:
	dart fix --apply

