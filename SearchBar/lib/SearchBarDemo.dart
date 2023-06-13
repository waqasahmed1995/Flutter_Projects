import 'package:flutter/material.dart';
import 'package:search_bar_demo/studentsmodel.dart';

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  // List<String> items = [
  //   'Apple',
  //   'Banana',
  //   'Orange',
  //   'Strawberry',
  //   'Watermelon',
  //   'Avogadro',
  //   'Ananas',
  // ];
  List<StudentsModel> filteredItems = [];

  @override
  void initState() {
    filteredItems.addAll(students);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<StudentsModel> filteredList = [];
    filteredList.addAll(students);
    if (query.isNotEmpty) {
      filteredList.retainWhere((students) =>
          students.name!.toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredItems.clear();
      filteredItems.addAll(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search Bar Demo'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(filteredItems[index].name.toString()),
                    subtitle: Text(filteredItems[index].age.toString() + '\n' + filteredItems[index].grade.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
