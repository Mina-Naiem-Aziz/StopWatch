import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({Key? key}) : super(key: key);

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  Timer? repeatedFunction;
  Duration duration = Duration(seconds: 0);
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(milliseconds: 1), (qqqqqq) {
      setState(() {
        int newSeconds = duration.inSeconds + 1;
        duration = Duration(seconds: newSeconds);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time and Date'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      duration.inHours.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: 75),
                    ),
                  ),
                  Text(
                    'Hours',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 22,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(fontSize: 75),
                    ),
                  ),
                  Text(
                    'Mainutes',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 22,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(fontSize: 75),
                    ),
                  ),
                  Text(
                    'Seconds',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 22,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    startTimer();
                  },
                  child: Text('Strat')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                  },
                  child: Text('Stop')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                    setState(() {
                      duration = Duration(seconds: 0);
                    });
                  },
                  child: Text('Cancal')),
            ],
          ),
        ],
      ),
    );
  }
}
