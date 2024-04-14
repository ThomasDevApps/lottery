part of '../../../lottery.dart';

class _CsvUtils {
  static Future<List<List<dynamic>>> readNumbersCsv(
    String path, {
    required bool fromAssets,
  }) async {
    if (fromAssets) {
      // Retrieve the file
      final input = await rootBundle.loadString(path);
      // Decode all fields
      List<List<dynamic>> fields = const CsvToListConverter().convert(input);
      return fields;
    } else {
      // Retrieve the file
      final input = File(path).openRead();
      // Decode all fields
      List<List<dynamic>> fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
      return fields;
    }
  }
}
