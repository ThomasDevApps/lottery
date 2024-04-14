<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Lottery

## Features

- Access to statistics for each number and special number 
(find out how many times the number has been drawn)
- Draw a grid at random while taking into account the probability of 
each number being drawn.
- Find out if the grid drawn at random is a winning grid

## Getting started

At the top of the application, you need to initialise the lottery with a 
CSV file to be used as data.

The ```pathCsv``` can be ```C:\\Users\\username\\Desktop\\Data\\MyLottery\\data.csv```

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the Lottery instance
  await Lottery.initialize(
    pathCsv: 'assets\\data_test.csv', // Path to data
    numbersColumn: [1, 2, 3, 4], // If the numbers are in the 1/2/3 and 4 column
    specialNumbersColumn: [5, 6, 7], // If the special numbers are in the 5/6 and 7 column
  );
  // Run the app
  runApp(const MyApp());
}
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
