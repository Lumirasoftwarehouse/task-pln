import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:task_management/completed.dart';
import 'package:task_management/task.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Task Management", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompletedTaskPage(),
                            ),
                          ),
                        child: TaskCard(
                        title: "Completed Tasks",
                        count: 8,
                        color: Colors.green.shade600.withOpacity(0.3),
                        textColor: Colors.white,
                      ),
                      )
                      
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskPage(),
                            ),
                          ),
                        child: TaskCard(
                        title: "Pending Tasks",
                        count: 5,
                        color: Colors.yellow.shade700.withOpacity(0.3),
                        textColor: Colors.white,
                      ),
                      )
                       
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TaskChart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final Color textColor;

  TaskCard({
    required this.title,
    required this.count,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      color: color,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "$count",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskChart extends StatelessWidget {
  final List<BarChartGroupData> barData = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(fromY: 0, toY: 4, color: Colors.blueAccent.shade200)
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(fromY: 0, toY: 6, color: Colors.blueAccent.shade200)
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(fromY: 0, toY: 3, color: Colors.blueAccent.shade200)
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(fromY: 0, toY: 8, color: Colors.blueAccent.shade200)
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(fromY: 0, toY: 5, color: Colors.blueAccent.shade200)
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Tasks Completed Over Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return Text("Nov 1");
                            case 2:
                              return Text("Nov 2");
                            case 3:
                              return Text("Nov 3");
                            case 4:
                              return Text("Nov 4");
                            case 5:
                              return Text("Nov 5");
                            default:
                              return Text("");
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: barData,
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
