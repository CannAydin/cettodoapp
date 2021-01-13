import 'package:cettodoapp/models/TaskItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';
//import 'dart:collection';
//import 'package:path_provider/path_provider.dart';
//import 'dart:io';

class TaskRepository extends ChangeNotifier {
  LocalStorage storage = new LocalStorage('todo_app');
  List<TaskItem> tasks = [];
  TaskRepository(){
    //addTask(TaskItem(title: 'buy some', isDone: false));
    //addTask(TaskItem(title: 'Go to market', isDone: false));
    //print('Constructor');
  }


  int taskCount(){
    if(tasks.length == null){
      return 0;
    }
    else    return tasks.length;
  }

  int incompleteTaskCount(){
    if(tasks.length == null){
      return 0;
    }
    else    return tasks.where((t) => !t.isDone).length;
  }

  /*void _saveToStorage(TaskItem task) {
    storage.setItem('todos', task);
  }*/

  /*void _delFromStorage(TaskItem task) async {
    await storage.clear();
  }*/

  void addTask(TaskItem task){
    tasks.add(task);
    storage.setItem('todo_app', task );
    print(storage.getItem('todos'));
    print(task.title);
    notifyListeners();
  }

  void toggleTask(TaskItem task) {
    task.isDone = !task.isDone;

    notifyListeners();
  }

  void deleteTask(TaskItem task) {
    tasks.remove(task);
    storage.deleteItem(task.title);

    notifyListeners();
  }
}