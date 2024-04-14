part of '../../../lottery.dart';

class _CsvUtils {
  static Future<List<List<dynamic>>> readNumbersCsv(
    String path,
  ) async {
    // Retrieve the file
    final input = File(path).openRead();
    // Decode all fields
    List<List<dynamic>> fields = await input
        .transform(utf8.decoder)
        .transform(
          CsvToListConverter(
            eol: Platform.environment.containsKey('FLUTTER_TEST')
                ? '\n'
                : defaultEol,
          ),
        )
        .toList();
    return fields;
  }
}
