import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lottery.initialize(
    pathCsv: 'assets\\data_test.csv',
    numberColumnIndexes: [0, 1, 2, 3],
    specialNumberColumnIndexes: [4, 5, 6],
    dateTimeColumnIndex: 7,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(cardColor: Colors.grey.shade900),
      home: LotteryScreen(
        cardColor: Colors.grey.shade900,
        numberOutputs: LotteryOutputs(
          outputs: Lottery().numbers,
          title: 'Numbers',
          decoration: const LotteryOutputsDecoration(),
        ),
        specialNumberOutputs: LotteryOutputs(
          outputs: Lottery().specialNumbers,
          title: 'Special numbers',
          decoration: const LotteryOutputsDecoration(),
        ),
        numbersLength: 4,
        specialNumbersLength: 3,
        numberDecoration: const LotteryNumberItemDecoration(
          backgroundColor: Colors.cyan,
        ),
        specialNumberDecoration: const LotteryNumberItemDecoration(
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}
