# nada_asignment

A Flutter take-home assignment that loads 24 profiles from a remote JSON
endpoint and shows them in a searchable list with a details screen.

## Overview

- **List screen** — name, age, city and `connected_through` for every profile,
  with a search field that filters by **name or city** (case-insensitive).
- **Details screen** — opened by tapping a row, shows every present field,
  highlights `connected_through`, and tells the user directly when there is no
  connection yet.
- **States** — loading, `No profiles match` (empty) and error with a **Retry**
  button.
- **Resilience** — missing/`null` fields, a long text and a Hindi profile are
  all rendered without crashes or overflow.
- **Adaptive layout** — content is wrapped in a `ResponsiveContent` and depends
  on the screen width (max content width + breakpoint in `core/themes`).
- **Branding** — app icon and splash screen use the Nada Network logo, and the
  whole UI renders in the **Mukta** font (Latin + Devanagari, bundled locally).

Data source (plain text, decoded as JSON in code):

```
https://gist.githubusercontent.com/jordandivyansh/c96fa18f141e0abb904e394eb91fbabb/raw/d235446f37cd51aad4cfffa2b76483498c27a7b9/take-home-profiles.json
```

## Tech stack

- **riverpod_flutter + riverpod_annotation** — state management and DI of providers.
- **Clean architecture (feature-first)** — `domain` / `data` / `presentation`.
- **go_router** — navigation (`/` and `/profile/:id`).
- **retrofit + dio** — HTTPS request with a plain-text response.
- **get_it + injectable** — dependency injection.
- **freezed + json_serializable** — models and entities.
- **Mukta** — bundled font with Latin and Devanagari support.
- **flutter_launcher_icons** — generates the launcher icon set from a single PNG.
- **build_runner** — code generation.

## Prerequisites

- Flutter SDK (Dart `^3.13.4`).
- An Android emulator or an iOS simulator.

## Getting started

```bash
flutter pub get
dart run build_runner build
```

## Running the app

Start an emulator/simulator, then:

```bash
flutter run
```

### Android emulator

```bash
# List available emulators
flutter emulators
# Launch one (example)
flutter emulators --launch <emulator_id>
# Run the app
flutter run
```

### iOS simulator (macOS only)

```bash
open -a Simulator
flutter run
```

## Tests

```bash
# Run all tests
flutter test

# Static analysis
flutter analyze
```

Test coverage:

- **Widget tests** — `profiles_list_screen_test.dart` (rendering, search
  filtering, empty state, error + Retry) and `profile_details_screen_test.dart`
  (present fields, missing connection, unknown id). A fake `profilesProvider`
  supplies the data; no network is used.
- **Unit tests** — `profiles_response_dto_test.dart` (JSON decoding with
  `null`/missing fields and non-Latin text), `profiles_repository_test.dart`
  (full decoding path through Retrofit against a fake HTTP adapter, including
  server and parse errors), `filter_profiles_test.dart` (search rules).
- **Fixtures** — `test/helpers/fixtures/profiles_fixture.dart` holds the sample
  JSON used by the data tests.

## Branding

The app icon and launch (splash) screen are branded with the Nada Network logo
purple `#67295F` + cream `#F5F0EE`.

- `branding/app_icon.png` — 1024×1024 source used by `flutter_launcher_icons`.
- `flutter_launcher_icons.yaml` — launcher icon config for Android and iOS.
- Splash screens are configured natively (no runtime dependency):
  - **Android** — `launch_background.xml` (brand background + centered logo).
  - **iOS** — `LaunchScreen.storyboard` (brand background + `LaunchImage`).

Regenerate launcher icons after changing `branding/app_icon.png`:

```bash
dart run flutter_launcher_icons
```

## Project structure

```
lib/
  core/
    constants/   # data source base URL and path, timeouts
    di/          # get_it + injectable setup
    error/       # exceptions, failures and mapping
    network/     # dio client and logging interceptor
    router/      # go_router routes
    themes/      # app_theme, app_colors, app_dimens
    widgets/     # shared widgets (responsive content)
  features/
    profiles/
      data/         # retrofit api, DTOs, mappers, repository
      domain/       # entity, repository interface, use cases
      presentation/ # providers, screens and widgets
```

## What I would do next

- Add pagination/lazy loading and cache results for offline use.
- Add sorting (by name/age) and a filter by community/city.
- Introduce debounce for the search field.
- Add a dark theme and a theme toggle.
- Add a "favorites" feature persisted locally.
- Share a profile and open the city on a map via deep links.
- Add golden tests and an integration test against the real endpoint.
- Improve accessibility (semantics labels).
- Localize the UI (the data already contains Hindi content).

## AI tools used

- **opencode CLI** (AI coding assistant) was used to scaffold the clean
  architecture, generate the theme/widget layer, and write the test suite.
  All generated code was reviewed, run through `flutter analyze` and covered by
  `flutter test`.