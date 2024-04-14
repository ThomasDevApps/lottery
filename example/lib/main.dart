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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LotteryScreen(
        outputs: [
          LotteryOutputs(
            outputs: {4: 16, 7: 2},
            title: 'Number',
            decoration: LotteryOutputsDecoration(primary: Colors.orange),
          )
        ],
      ),
    );
  }
}
