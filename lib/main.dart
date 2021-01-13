import 'package:flutter/material.dart';
import 'package:cettodoapp/Screens/MainPage.dart';
import 'package:cettodoapp/models/TaskRepository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TaskRepository>(
    create: (context) => TaskRepository(),
    child: MaterialApp(
      home: MainPage(),
    ),
  )
  );
}


