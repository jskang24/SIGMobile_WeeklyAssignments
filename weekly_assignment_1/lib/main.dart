import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MyHomePage(title: 'FizzBuzz');
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _text = "fizzbuzz";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _changeText(_counter);
  }

  void _reduceCounter() {
    setState(() {
      _counter--;
    });
    _changeText(_counter);
  }

  void _changeText(int cnt) {
    setState(() {
      if (cnt % 15 == 0) {
        _text = "fizzbuzz";
      } else if (cnt % 3 == 0) {
        _text = "fizz";
      } else if (cnt % 5 == 0) {
        _text = "buzz";
      } else {
        _text = "-";
      }
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text('$_text', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 5.h),
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                    _changeText(_counter);
                  },
                  child: const Text("0"),
                ),
                SizedBox(
                  width: 30.w,
                ),
                FloatingActionButton(
                  onPressed: _reduceCounter,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 30.w),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
