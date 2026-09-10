import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.favorite),
          title: Text("Aplikasi Pertama"),
          backgroundColor: Colors.pinkAccent,
          actions: [Icon(Icons.card_membership)],
        ),
        // body: Center(
        //   // child: Text(
        //   //   "Hello World",
        //   //   style: TextStyle(
        //   //     fontSize: 20,
        //   //     color: Colors.pinkAccent,
        //   //     fontWeight: FontWeight.bold,
        //   //   ),
        //   // ),
        //   child: Container(
        //     color: Colors.pinkAccent,
        //     padding: EdgeInsets.only(right: 50),
        //     child: Text("Hello World"),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            // children: [
            //   Container(height: 70, width: 70, color: Colors.black),
            //   Container(height: 70, width: 70, color: Colors.pinkAccent),
            //   Container(height: 70, width: 70, color: Colors.black),
            // ],
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/download.jpeg'),
              Image.asset('assets/download.jpeg'),
              Image.asset('assets/download.jpeg'),
            ],
          ),
        ),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
