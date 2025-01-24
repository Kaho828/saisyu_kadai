import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String) onTaskAdded;
  const AddTaskScreen({super.key, required this.onTaskAdded});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController(); // 新WidgetのTextEditingController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('タスクを追加')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  TextField(// 新WidgetのTextFieldを使用
                    controller: _controller, 
                    decoration: const InputDecoration(
                      labelText: 'タスク名',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onTaskAdded(_controller.text);
                      Navigator.pop(context);
                    },
                    child: const Text('保存'),
                  ),
                ]
            )
        ),
    );
  }
    @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}

class Task {
  String name;
  bool isDone;

  Task({required this.name, required this.isDone});
}
