import 'package:flutter/material.dart';
import 'package:stream_exp/streams.dart';

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
          child: StreamBuilder(
            stream: randomNumberStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                // FALL 1: Future ist komplett und hat Daten!
                final response = snapshot.data;

                return Text("Die Zahl ist: $response");
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
