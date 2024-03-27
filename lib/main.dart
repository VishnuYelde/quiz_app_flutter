// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Hello World App'),
//         ),
//         body: Center(
//           child: const Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '5 + 4 = ?',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter your answer'),
            ),
            ElevatedButton(
              onPressed: () {
                String userAnswer = answerController.text.trim();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          QuestionScreen2({'question_1': userAnswer})),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
}

class QuestionScreen2 extends StatefulWidget {
  final Map<String, String> answerData;
  const QuestionScreen2(this.answerData, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreen2State createState() => _QuestionScreen2State();
}

class _QuestionScreen2State extends State<QuestionScreen2> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'How many types of widgets are there in Flutter?',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter your answer'),
            ),
            ElevatedButton(
              onPressed: () {
                String userAnswer = answerController.text.trim();
                widget.answerData['question_2'] = userAnswer;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionScreen3(widget.answerData)),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
}

class QuestionScreen3 extends StatefulWidget {
  final Map<String, String> answerData;
  const QuestionScreen3(this.answerData, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreen3State createState() => _QuestionScreen3State();
}

class _QuestionScreen3State extends State<QuestionScreen3> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Who developed the Flutter framework?',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Enter your answer'),
            ),
            ElevatedButton(
              onPressed: () {
                String userAnswer = answerController.text.trim();
                widget.answerData['question_3'] = userAnswer;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionScreen4(widget.answerData)),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
}

class QuestionScreen4 extends StatefulWidget {
  final Map<String, String> answerData;
  const QuestionScreen4(this.answerData, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreen4State createState() {
    return _QuestionScreen4State();
  }
}

class _QuestionScreen4State extends State<QuestionScreen4> {
  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'A sequence of asynchronous Flutter events is known as?',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Enter your answer'),
            ),
            ElevatedButton(
              onPressed: () {
                String userAnswer = answerController.text.trim();
                widget.answerData['question_4'] = userAnswer;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionScreen5(widget.answerData)),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
}

class QuestionScreen5 extends StatefulWidget {
  final Map<String, String> answerData;
  const QuestionScreen5(this.answerData, {super.key});

 @override
  // ignore: library_private_types_in_public_api
  _QuestionScreen5State createState() {
    return _QuestionScreen5State();
  }
}
class _QuestionScreen5State extends State<QuestionScreen5> { 
  TextEditingController answerController = TextEditingController(); 

@override
Widget build(BuildContext context) { 
  return Scaffold( 
    appBar: AppBar( 
      title: const Text('Quiz App'),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ const Text('Access to a cloud database through Flutter is available through which service?',
            style: TextStyle(fontSize: 20),
          ),
          TextField( controller: answerController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(labelText: 'Enter your answer'),
          ),
          ElevatedButton( 
            onPressed: () { 
              String userAnswer = answerController.text.trim();
              widget.answerData['question_5'] = userAnswer;
              // This is the last question, you can navigate to a final screen
              Navigator.pushReplacement( context,
              MaterialPageRoute(builder: (context) => QuizResultScreen(widget.answerData)),
              ); 
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    ),
  );
}

  @override
  void dispose() { 
    answerController.dispose();
    super.dispose();
  }
}

class QuizResultScreen extends StatelessWidget {
  final Map<String, String> answerData;
  QuizResultScreen(this.answerData, {super.key});

// Define the correct answers for each question

  final Map<String, String> correctAnswers = {
    'question_1': '9',
    'question_2': '2',
    'question_3': 'google',
    'question_4': 'stream',
    'question_5': 'firebase',
  };

// Define the actual questions

  final Map<String, String> questions = {
    'question_1': '5 + 4 = ?',
    'question_2': 'How many types of widgets are there in Flutter?',
    'question_3': 'Who developed the Flutter framework?',
    'question_4': 'A sequence of asynchronous Flutter events is known as?',
    'question_5': 'Access to a cloud database through Flutter is available through which service?',
  };

  @override
  Widget build(BuildContext context) {
    // Calculate the total correct answers
    // ignore: unused_local_variable
    int correctCount = 0;
    answerData.forEach((key, value) {
      if (correctAnswers[key] == value) {
        correctCount++;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quiz Results:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Display each question, user's answer, and correct answer with color based on correctness
            for (var entry in answerData.entries)
              Text.rich(
                TextSpan(
                  text: '${questions[entry.key]}: ',
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: entry.value,
                      style: TextStyle(
                        color: entry.value == correctAnswers[entry.key]
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    if (entry.value != correctAnswers[entry.key])
                      TextSpan(
                        text: ' (Correct answer: ${correctAnswers[entry.key]})',
                        style: const TextStyle(color: Colors.green),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            // Display the total correct answers
            Text(
              'Total Correct Answers: $correctCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Finish Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
