import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'task_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> tasks =
      []; // Stores tasks with title and description

  void addTask(String title, String description) {
    setState(() {
      tasks.add({'title': title, 'description': description});
    });
  }

  void editTask(int index, String title, String description) {
    setState(() {
      tasks[index] = {'title': title, 'description': description};
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        centerTitle: true,
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'No tasks available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title'] ?? ''),
                  subtitle: Text(tasks[index]['description'] ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(
                          task: tasks[index],
                          onEdit: (title, description) {
                            editTask(index, title, description);
                          },
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteTask(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTask != null) {
            addTask(newTask['title'], newTask['description']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
