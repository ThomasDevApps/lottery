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

## Preview

![Alt text](./example/assets/preview.png?raw=true "Title")

## Getting started

At the top of the application, you need to initialise the lottery with a 
CSV file to be used as data : 

```dart
Future<void> main() async {
  // Add this line at the top
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the Lottery instance
  await Lottery.initialize(
    pathCsv: 'assets\\data_test.csv', // Path to data
    numberColumnIndexes: [0, 1, 2, 3], // If the numbers are in the 1,2,3 and 4 column's index
    specialNumberColumnIndexes: [4, 5, 6], // If the special numbers are in the 5,6 and 7 column's index
  );
  // Run the app
  runApp(const MyApp());
}
```

The `pathCsv` can be for example `C:\\Users\\username\\Desktop\\Data\\MyLottery\\data.csv`.

## Usage

A complete example is in the `example` folder.

## Additional information

This package is not officially linked to any lottery.
