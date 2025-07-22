// To Do list Manager Application
// Use Dart’s stdin and stdout for input/output
// Implement CRUD (Create, Read, Update, Delete) operations for tasks
// Store tasks in a list or a file (using dart:io)

import 'dart:io';

void main() async {
  // Initialize the task list
  File taskFile = File('TD.txt');
  List<String> tasks = await taskFile.readAsLines();
  while (true) {
    displayMenu();
    askForInput(tasks);
    await saveTasks(tasks, taskFile);
  }
}

Future<void> saveTasks(List tasks, File taskFile) async {
  await taskFile.writeAsString(tasks.join('\n'));
  print('Tasks saved successfully.');
}

void displayMenu() {
  print('To Do List Manager');
  print('1. Add Task');
  print('2. View Tasks');
  print('3. Update Task');
  print('4. Delete Task');
  print('5. Exit');
}

void viewTasks(List tasks) {
  for (int i = 0; i < tasks.length; i++) {
    print('     ${i + 1}. ${tasks[i]}');
  }
}

void deleteTask(List tasks) {
  viewTasks(tasks);
  print('Enter task number to delete:');
  String? input = stdin.readLineSync();
  if (input != null && int.tryParse(input) != null) {
    int taskNumber = int.parse(input);
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      tasks.removeAt(taskNumber - 1);
      print('Task deleted successfully.');
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Please enter a valid number.');
  }
}

void updateTask(List tasks) {
  viewTasks(tasks);
  print('Enther task number to update:');
  String? input = stdin.readLineSync();
  if (input != null && int.tryParse(input) != null) {
    int taskNumber = int.parse(input);
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      print('Enter new description for task $taskNumber:');
      String? newDescription = stdin.readLineSync();
      if (newDescription != null && newDescription.isNotEmpty) {
        tasks[taskNumber - 1] = newDescription;
        print('Task updated successfully.');
      } else {
        print('Task description cannot be empty.');
      }
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Please enter a valid number.');
  }
}

void addTask(List tasks) {
  print('Enter task description:');
  String? taskDescription = stdin.readLineSync();
  if (taskDescription != null && taskDescription.isNotEmpty) {
    tasks.add(taskDescription);
    print('Task added successfully.');
  } else {
    print('Task description cannot be empty.');
  }
}

void askForInput(List tasks) {
  print('Please enter your choice:');
  String? input = stdin.readLineSync();
  if (input != null) {
    switch (input) {
      case '1':
        addTask(tasks);
        break;
      case '2':
        viewTasks(tasks);
        break;
      case '3':
        updateTask(tasks);
        break;
      case '4':
        deleteTask(tasks);
        break;
      case '5':
        exit(0);
      default:
        print('Invalid choice, please try again.');
    }
  }
}
