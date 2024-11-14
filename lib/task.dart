import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {"phase": "Planning", "title": "Define project scope"},
    {"phase": "Development", "title": "Set up project repository"},
    {"phase": "Development", "title": "Implement user authentication"},
    {"phase": "Testing", "title": "Write unit tests"},
    {"phase": "Review", "title": "Code review with the team"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Tasks"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(
                phase: task['phase'],
                title: task['title'],
                onTap: () => _showCompletionDialog(context, task['title']),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context, String taskTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text("Complete Task"),
          content: Text("Are you sure you want to complete the task \"$taskTitle\"?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                // Update task completion status here in a real application.
              },
            ),
          ],
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  final String phase;
  final String title;
  final VoidCallback onTap;

  TaskCard({required this.phase, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 3,
      color: Colors.white,
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        title: Text(
          phase,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
        ),
        subtitle: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        ),
      ),
    );
  }
}
