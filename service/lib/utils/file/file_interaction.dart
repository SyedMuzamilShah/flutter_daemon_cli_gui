// import 'package:path/path.dart' as p;
// import 'dart:convert';
// import 'dart:io';

// class FileInteraction {
//   static final _instance = FileInteraction._internal();
//   factory FileInteraction() => _instance;

//   FileInteraction._internal() {
//     final String baseDir = File.fromUri(Platform.script).parent.path;
//     final projectRoot = Directory(baseDir).parent.path; 
//     filePath = p.join(projectRoot, 'lib', 'core', 'appconfig', 'auth.json');
//   }

//   late final String filePath;
//   void writeFile(Map<String, dynamic> data) {
//     final file = File(filePath);
//     final content = jsonEncode(data);
//     file.writeAsStringSync(content);
//   }

//   Map<String, dynamic>? readFile() {
//     final file = File(filePath);
//     print("Testing if file exists:");
//     print(file.existsSync());
//     if (!file.existsSync()) {
//       return null;
//     }
//     final content = file.readAsStringSync();
//     return jsonDecode(content);
//   }
// }
