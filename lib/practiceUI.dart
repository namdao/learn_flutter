// import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'My App', home: Counter()));
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _MyApp();
}

class _MyApp extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const IconButton(onPressed: null, icon: Icon(Icons.access_alarm)),
        title: const Text('Example title'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(child: Text('Hello center')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: _increment, child: const Text('Increment')),
              const SizedBox(width: 16),
              Text('Count: $_counter'),
            ],
          ),
          GestureDetector(
            onTap: () {
              print('ong tap');
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.amber[500]),
              child: const Center(child: Text('aaaa')),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(children: [
//         MyApp(
//           title: Text(
//             'This is my app, hello word hello word hello wordhello word hello word , hello word hello word hello wordhello word hello word',
//             style: Theme.of(context).primaryTextTheme.titleLarge,
//           ),
//         ),
//         const Expanded(child: Text("hello word hello word hello wordhello word hello word"
//         "hello wordhello word hello word hello wordhello word hello word hello wordhello word hello word"
//         "hello wordhello word hello word hello wordhello word hello word hello wordhello word hello word hello word"))
//       ]),
//     );
//   }
// }
