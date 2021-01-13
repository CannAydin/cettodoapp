import 'package:cettodoapp/models/TaskRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskRepository>(
      builder: (context, taskRepository, child){
        return ListView.builder(
          itemCount: taskRepository.taskCount(),
          itemBuilder: (context, index) {
            var task = taskRepository.tasks[index];
            return TaskTile(
              title: task.title,
              isDone: task.isDone,
              onCheckboxClicked: (value) {
                taskRepository.toggleTask(task);
              },
              onLogPress: () async {
                if(Platform.isIOS) {
                  await showCupertinoDialog(
                      context: context,
                      builder: (context) =>
                          CupertinoAlertDialog(
                            title: Text('Emin misiniz?'),
                            content: Text(
                                '${task
                                    .title} silmek istediğinizden emin misiniz? \n Bu işlem geri alınamaz'
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('Evet'), onPressed: () {
                                taskRepository.deleteTask(task);
                                Navigator.of(context).pop();
                              },),
                              CupertinoDialogAction(
                                child: Text('Hayır'), onPressed: () {
                                Navigator.of(context).pop();
                              },),
                            ],
                          ));
                }
                else {
                  await showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Text('Emin misiniz?'),
                            content: Text(
                                '${task
                                    .title} silmek istediğinizden emin misiniz? \n Bu işlem geri alınamaz'
                            ),
                            actions: [
                              FlatButton(
                                child: Text('Evet'), onPressed: () {
                                taskRepository.deleteTask(task);
                                Navigator.of(context).pop();
                              },),
                              FlatButton(
                                child: Text('Hayır'), onPressed: () {
                                Navigator.of(context).pop();
                              },),
                            ],
                          ));
                }
              },
            );
          }
        );
      }
    );
  }
}


