import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nada_asignment/core/di/injection.dart';
import 'package:nada_asignment/features/profiles/domain/entities/profile.dart';
import 'package:nada_asignment/features/profiles/presentation/providers/profiles_providers.dart';
import 'package:nada_asignment/features/profiles/presentation/screens/profile_details_screen.dart';

const List<Profile> _fakeProfiles = <Profile>[
  Profile(
    id: 1,
    name: 'Ananya Sharma',
    age: 27,
    gender: 'F',
    city: 'Noida',
    community: 'Brahmin',
    profession: 'Product designer at a fintech',
    education: 'B.Des, NIFT Delhi',
    degree: 1,
    connectedThrough: 'Your cousin Nikhil knows her brother.',
    about: 'Reads a book a week.',
  ),
  Profile(
    id: 2,
    name: 'Nikhil Yadav',
    age: 29,
    city: 'Varanasi',
    profession: 'Assistant professor of history',
  ),
];

class _FakeProfiles extends Profiles {
  @override
  Future<List<Profile>> build() async => _fakeProfiles;
}

Future<void> _pumpDetails(
  WidgetTester tester, {
  required int profileId,
}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        profilesProvider.overrideWith(_FakeProfiles.new),
      ],
      child: MaterialApp(home: ProfileDetailsScreen(profileId: profileId)),
    ),
  );
}

void main() {
  setUpAll(configureDependencies);

  testWidgets('renders present fields and highlights connected through', (
    WidgetTester tester,
  ) async {
    await _pumpDetails(tester, profileId: 1);
    await tester.pumpAndSettle();

    expect(find.text('Ananya Sharma'), findsOneWidget);
    expect(find.text('27'), findsOneWidget);
    expect(find.text('Noida'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    expect(find.text('Brahmin'), findsOneWidget);
    expect(find.text('Product designer at a fintech'), findsOneWidget);
    expect(find.text('Connected through'), findsOneWidget);
    expect(find.text('Your cousin Nikhil knows her brother.'), findsOneWidget);
  });

  testWidgets('shows a clear message when there is no connection', (
    WidgetTester tester,
  ) async {
    await _pumpDetails(tester, profileId: 2);
    await tester.pumpAndSettle();

    expect(find.text('Connected through'), findsOneWidget);
    expect(find.text('No connection yet.'), findsOneWidget);
  });

  testWidgets('shows a fallback when the profile id does not exist', (
    WidgetTester tester,
  ) async {
    await _pumpDetails(tester, profileId: 999);
    await tester.pumpAndSettle();

    expect(find.text('This profile is not available.'), findsOneWidget);
  });
}