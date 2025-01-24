import 'package:flutter/material.dart';
import 'add_task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = []; // タスクリスト

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName, isDone: false));
    });
  }

  void toggleTaskStatus(int index){
    setState(() {//setstate
      tasks[index].isDone =!tasks[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do リスト')),
      body: Column( // Column Widgetを使用タスクリストとタスク追加ボタンを縦に表示
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen(onTaskAdded: addTask)), // 画面遷移
              );
            },
            child: const Text('タスクを追加'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card( // 新Widget,Cardを使用
                elevation: 10,//影
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row( // Row Widgetを使用
                      children: [
                        Checkbox(
                            value: tasks[index].isDone,
                            onChanged: (bool? value){
                              toggleTaskStatus(index);
                            }
                        ),// 新widget
                        Expanded(
                            child: Text(tasks[index].name,
                            style:  tasks[index].isDone? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ) :null,
                            ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            })
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
