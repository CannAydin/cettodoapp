import 'package:cettodoapp/models/TaskItem.dart';
import 'package:cettodoapp/models/TaskRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*2/3,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) {
                taskTitle = value;

              },
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 18),
              autofocus: true,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
                onPressed: () {
                  if(taskTitle != null){
                    Provider.of<TaskRepository>(context, listen: false).addTask(TaskItem(title : taskTitle , isDone : false));
                  }
                  Navigator.of(context).pop();
            },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
