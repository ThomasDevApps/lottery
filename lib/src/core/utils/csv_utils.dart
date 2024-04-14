part of '../../../lottery.dart';

class _CsvUtils {
  static Future<List<List<dynamic>>> readNumbersCsv(
    String path, {
    required bool fromAssets,
  }) async {
    // Retrieve the file
    final input = fromAssets
        ? File('${Directory.current.path}\\$path').openRead()
        : File(path).openRead();
    // Decode all fields
    List<List<dynamic>> fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    return fields;
  }
}
