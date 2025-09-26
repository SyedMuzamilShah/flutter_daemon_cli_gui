import 'dart:convert';
import 'dart:io';

class FileInteraction {
  static final _instance = FileInteraction._internal();
  factory FileInteraction() => _instance;
  FileInteraction._internal();

  String filePath = '../lib/core/appconfig/auth.json';

  void writeFile(Map<String, dynamic> data) {
    final file = File(filePath);
    final content = jsonEncode(data);
    file.writeAsStringSync(content);
  }

  Map<String, dynamic>? readFile() {
    final file = File(filePath);
    print("Testing if file exists:");
    print(file.existsSync());
    if (!file.existsSync()) {
      return null;
    }
    final content = file.readAsStringSync();
    return jsonDecode(content);
  }
}
