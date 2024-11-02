import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Celebrare',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              color: Color.fromARGB(255, 169, 236, 245),
              child: Column(
                children: [
                  Row(
                    children: [
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text('Undo'),
                      // ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text('Redo'),
                      // ),
                    ],
                  ),
                  Card(
                    child: Column(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
