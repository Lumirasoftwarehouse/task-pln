import 'package:flutter/material.dart';

class CompletedTaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks = [
    {"phase": "Planning", "title": "Define project scope", "completionDate": "Nov 1, 2024"},
    {"phase": "Development", "title": "Set up project repository", "completionDate": "Nov 2, 2024"},
    {"phase": "Development", "title": "Implement user authentication", "completionDate": "Nov 3, 2024"},
    {"phase": "Testing", "title": "Write unit tests", "completionDate": "Nov 4, 2024"},
    {"phase": "Review", "title": "Code review with the team", "completionDate": "Nov 5, 2024"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Tasks"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              final task = completedTasks[index];
              return CompletedTaskCard(
                phase: task['phase'],
                title: task['title'],
                completionDate: task['completionDate'],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CompletedTaskCard extends StatelessWidget {
  final String phase;
  final String title;
  final String completionDate;

  CompletedTaskCard({required this.phase, required this.title, required this.completionDate});

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
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        title: Text(
          phase,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.green.shade700,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Completed on: $completionDate",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.check_circle_outline,
          color: Colors.green.shade700,
          size: 24,
        ),
      ),
    );
  }
}
