import 'package:flutter/material.dart';

const List<String> list = <String>['Characters', 'Words'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Counter PoRe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Word Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = list.first; // Default value for dropdown
  String userInput = ''; // user input from the TextField
  String result = ''; // result of the count

  // chars counter
  int getCharsCount(String userPhrase) {
    return userPhrase.length;
  }ffgbgfgf

  // words counter
  int getWordsCount(String userPhrase) {
    String trimmedPhrase = userPhrase.trim();
    if (trimmedPhrase.isEmpty) {
      return 0;
    } else {
  
      List<String> words = trimmedPhrase.split(RegExp(r'[ \s,.]+'));

      return words.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('Select an option:'),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
                height: 20), // Add some space between dropdown and text field
            // ignore: prefer_const_constructors
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your text',
              ),
              onChanged: (value) {
                setState(() {
                  userInput = value; // Update the user input when text changes
                });
              },
            ),
            const SizedBox(
                height: 20), // Add space between text field and button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (dropdownValue == 'Characters') {
                    // chars count
                    result = getCharsCount(userInput).toString();
                  } else {
                    // words count
                    result = getWordsCount(userInput).toString();
                  }
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20), // Add space between button and result
            Text(
              'Result: $result', // Show the result
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
