import 'package:flutter/material.dart';

void main(){
  runApp(const LongestWord());
}

class LongestWord extends StatefulWidget {
  const LongestWord({Key? key}) : super(key: key);

  @override
  State<LongestWord> createState() => _LongestWordState();
}

class _LongestWordState extends State<LongestWord> {

  TextEditingController stringController = TextEditingController();

  //. Write a function in Dart that takes the sentence as input
  // and returns the count of each word in the sentence as a Map,
  // where the word is the key and the count is the value
  Map<String, int> map = {};


  void wordCount(String a) {

    List<String> words = a.trim().split(' ');

    map = {};

    for (String word in words) {
      if (map.containsKey(word))
        {map[word] = map[word]! + 1 ; }
      else
        { map[word] =1 ;}
    }
    // return map;
  setState(() {});

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Word Counter')),
        ),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Expanded(
                  child: TextField(
                    //onEditingComplete: wordCount,
                    // onSubmitted: (value){
                    //   wordCount(value);
                    // },
                    onChanged: (value){
                      wordCount(value);
                    },
                    controller: stringController,
                    decoration: const InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                  // ElevatedButton(
                  //     onPressed: wordCount(stringController.text),
                  //     child: Text('Search')
                  // ),
                ]
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: map.length,
                itemBuilder: (context,index){

                  String key = map.keys.elementAt(index); // to get key of element at index
                  return ListTile(
                    title: Text('Word : $key'),
                    subtitle: Text('Number of Count : ${map[key]}'),
                  );

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
