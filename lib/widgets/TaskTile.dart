import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function onCheckboxClicked;
  final Function onLogPress;
  const TaskTile({
    this.title,
    this.isDone,
    this.onCheckboxClicked,
    this.onLogPress,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLogPress,
      title: Text(
        this.title,
        style: TextStyle(
            color: Colors.lightBlueAccent,
            decoration: isDone ? TextDecoration.lineThrough : null,
        ),

      ),
      trailing: Checkbox(
        value: isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: onCheckboxClicked,
      ),
    );
  }
}