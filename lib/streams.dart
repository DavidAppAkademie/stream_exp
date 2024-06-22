import 'dart:math';

/// A stream that emits a number every second
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

/// A stream that emits a number every second
/// Has error on  5th element
Stream<int> countStream2(int to) async* {
  for (int i = 1; i <= to; i++) {
    await Future.delayed(const Duration(seconds: 1));
    if (i == 5) {
      throw Exception('Error on $i');
    }
    yield i;
  }
}

/// Starts with user not logged in
/// After 10 seconds, user is logged in
Stream<bool> userLoggedInStream() async* {
  await Future.delayed(const Duration(seconds: 3));

  yield false;
  await Future.delayed(const Duration(seconds: 10));
  yield true;
}

/// A conversation stream between two people
Stream<List<String>> chatStream() async* {
  await Future.delayed(const Duration(seconds: 3));
  yield ['Hallo'];
  await Future.delayed(const Duration(seconds: 2));
  yield ['Hallo', 'Wie geht es dir?'];
  await Future.delayed(const Duration(seconds: 5));
  yield ['Hallo', 'Wie geht es dir?', 'Mir geht es gut'];
  await Future.delayed(const Duration(seconds: 3));
  yield ['Hallo', 'Wie geht es dir?', 'Mir geht es gut', 'Was machst du?'];
  await Future.delayed(const Duration(seconds: 5));
  yield [
    'Hallo',
    'Wie geht es dir?',
    'Mir geht es gut',
    'Was machst du?',
    'Ich arbeite'
  ];
  await Future.delayed(const Duration(seconds: 2));
  yield [
    'Hallo',
    'Wie geht es dir?',
    'Mir geht es gut',
    'Was machst du?',
    'Ich arbeite',
    'Ich auch'
  ];
  await Future.delayed(const Duration(seconds: 4));
  yield [
    'Hallo',
    'Wie geht es dir?',
    'Mir geht es gut',
    'Was machst du?',
    'Ich arbeite',
    'Ich auch',
    'Schön'
  ];
  await Future.delayed(const Duration(seconds: 1));
  yield [
    'Hallo',
    'Wie geht es dir?',
    'Mir geht es gut',
    'Was machst du?',
    'Ich arbeite',
    'Ich auch',
    'Schön',
    'Ja'
  ];
}

/// A conversation stream between two people
/// This one has an error after 5th message
Stream<List<String>> chatStream2() async* {
  await Future.delayed(const Duration(seconds: 3));
  yield ['Hallo'];
  await Future.delayed(const Duration(seconds: 2));
  yield ['Hallo', 'Wie geht es dir?'];
  await Future.delayed(const Duration(seconds: 5));
  yield ['Hallo', 'Wie geht es dir?', 'Mir geht es gut'];
  await Future.delayed(const Duration(seconds: 3));
  yield ['Hallo', 'Wie geht es dir?', 'Mir geht es gut', 'Was machst du?'];
  await Future.delayed(const Duration(seconds: 5));
  yield [
    'Hallo',
    'Wie geht es dir?',
    'Mir geht es gut',
    'Was machst du?',
    'Ich arbeite'
  ];
  await Future.delayed(const Duration(seconds: 2));
  throw Exception('Error on 5');
}

/// A stream that emits a random number every second
Stream<int> randomNumberStream() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield Random().nextInt(100);
  }
}
