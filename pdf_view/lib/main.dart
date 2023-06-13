import 'package:flutter/material.dart';

import 'marksheet.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GPAHomePage(),
    );
  }
}

class GPAHomePage extends StatefulWidget {
  @override
  _GPAHomePageState createState() => _GPAHomePageState();
}

class _GPAHomePageState extends State<GPAHomePage> {
  List<Subject> subjects = [];

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController creditHoursController = TextEditingController();

  double calculateGPA() {
    if (subjects.isEmpty) {
      return 0.0;
    }

    double totalCreditHours = 0;
    double weightedGradePoints = 0;

    for (var subject in subjects) {
      totalCreditHours += subject.creditHours!;
      weightedGradePoints += (subject.gradePoint! * subject.creditHours)!;
    }

    return weightedGradePoints / totalCreditHours;
  }

  void addSubject() {
    String subjectName = subjectController.text;
    String grade = gradeController.text;
    double creditHours = double.tryParse(creditHoursController.text) ?? 0;

    if (subjectName.isNotEmpty && grade.isNotEmpty && creditHours > 0) {
      Subject newSubject = Subject(subjectName, grade, creditHours);
      setState(() {
        subjects.add(newSubject);
      });
      subjectController.clear();
      gradeController.clear();
      creditHoursController.clear();
    }
  }

  void removeSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Subjects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  Subject subject = subjects[index];
                  return ListTile(
                    title: Text(subject.name),
                    subtitle: Text('Grade: ${subject.grade}, '
                        'Credit Hours: ${subject.creditHours}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeSubject(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Add Subject',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Subject Name'),
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: creditHoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Credit Hours'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addSubject,
              child: Text('Add'),
            ),
            SizedBox(height: 16),
            Text(
              'GPA: ${calculateGPA().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
