import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: LotteryScreen(
        outputs: const [
          LotteryOutputs(
            outputs: {4: 16, 7: 2},
            title: 'Number',
            decoration: LotteryOutputsDecoration(primary: Colors.blue),
          ),
          LotteryOutputs(
            outputs: {1: 15, 42: 10},
            title: 'Special',
            decoration: LotteryOutputsDecoration(primary: Colors.orange),
          )
        ],
        length: 4,
        specialLength: 3,
        numberDecoration: LotteryNumberItemDecoration(
          backgroundColor: Colors.blue,
        ),
        specialNumberDecoration: LotteryNumberItemDecoration(
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
