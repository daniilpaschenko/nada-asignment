import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nada_asignment/core/di/injection.dart';
import 'package:nada_asignment/features/profiles/domain/entities/profile.dart';
import 'package:nada_asignment/features/profiles/presentation/screens/profiles_list_screen.dart';
import 'package:nada_asignment/features/profiles/presentation/providers/profiles_providers.dart';

const List<Profile> _fakeProfiles = <Profile>[
  Profile(id: 1, name: 'Alice Johnson', age: 29, city: 'Berlin'),
  Profile(id: 2, name: 'Bob Smith', age: 34, city: 'Paris'),
  Profile(id: 3, name: 'Carol White', age: 41, city: 'London'),
];

class _FakeProfiles extends Profiles {
  @override
  Future<List<Profile>> build() async => _fakeProfiles;
}

class _FailingProfiles extends Profiles {
  @override
  Future<List<Profile>> build() async => throw Exception('boom');
}

Future<void> _pumpSubject(
  WidgetTester tester, {
  required bool failing,
}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        profilesProvider.overrideWith(
          failing ? _FailingProfiles.new : _FakeProfiles.new,
        ),
      ],
      child: const MaterialApp(home: ProfilesListScreen()),
    ),
  );
}

void main() {
  setUpAll(configureDependencies);

  testWidgets('renders every profile returned by the provider', (
    WidgetTester tester,
  ) async {
    await _pumpSubject(tester, failing: false);
    await tester.pumpAndSettle();

    expect(find.text('Alice Johnson'), findsOneWidget);
    expect(find.text('Bob Smith'), findsOneWidget);
    expect(find.text('Carol White'), findsOneWidget);
  });

  testWidgets('filters the list by city, case-insensitively', (
    WidgetTester tester,
  ) async {
    await _pumpSubject(tester, failing: false);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bErLiN');
    await tester.pumpAndSettle();

    expect(find.text('Alice Johnson'), findsOneWidget);
    expect(find.text('Bob Smith'), findsNothing);
    expect(find.text('Carol White'), findsNothing);
  });

  testWidgets('shows the empty message when nothing matches', (
    WidgetTester tester,
  ) async {
    await _pumpSubject(tester, failing: false);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'zzz-no-match');
    await tester.pumpAndSettle();

    expect(find.text('No profiles match.'), findsOneWidget);
    expect(find.text('Alice Johnson'), findsNothing);
  });

  testWidgets('shows the error view with a retry button on failure', (
    WidgetTester tester,
  ) async {
    await _pumpSubject(tester, failing: true);
    await tester.pumpAndSettle();

    expect(find.text('Retry'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('No profiles match.'), findsNothing);
  });
}
