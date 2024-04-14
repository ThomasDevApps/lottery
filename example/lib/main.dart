import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lottery.initialize(
    pathCsv: 'assets\\data_test.csv',
    fromAssets: true,
    numbersColumn: [1, 2, 3, 4],
    specialNumbersColumn: [5, 6, 7],
  );
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
        outputs: [
          LotteryOutputs(
            outputs: Lottery().numbers,
            title: 'Number',
            decoration: const LotteryOutputsDecoration(primary: Colors.blue),
          ),
          LotteryOutputs(
            outputs: Lottery().specialNumbers,
            title: 'Special',
            decoration: const LotteryOutputsDecoration(primary: Colors.orange),
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
