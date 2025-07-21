// To Do list Manager Application
// Use Dart’s stdin and stdout for input/output
// Implement CRUD (Create, Read, Update, Delete) operations for tasks
// Store tasks in a list or a file (using dart:io)

import 'dart:io';

void main() async {
  var config = File('importantData.txt');

  var sink = config.openWrite();
  sink.write('File Accessed!!');

  await sink.flush();
  await sink.close();
}
