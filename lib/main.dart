import 'package:flutter/material.dart';
import 'package:stream_exp/futures.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: getRandomChuckJoke(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                // FALL 1: Future ist komplett und hat Daten!
                final response = snapshot.data;
                return Text("$response");
              } else if (snapshot.connectionState != ConnectionState.done) {
                // FALL 2: Sind noch im Ladezustand
                return const CircularProgressIndicator();
              } else {
                // FALL 3: Es gab nen Fehler
                return const Icon(Icons.error);
              }
            },
          ),
        ),
      ),
    );
  }
}
