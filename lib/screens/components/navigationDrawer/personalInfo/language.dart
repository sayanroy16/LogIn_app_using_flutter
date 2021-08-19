import 'package:flutter/material.dart';

class Mylangauge extends StatefulWidget {
  static const String id = 'langauge.dart';
  @override
  _State createState() => _State();
}

class _State extends State<Mylangauge> {
  final List<String> names = <String>[];
  final List<int> msgCount = <int>[];

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      msgCount.insert(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Langauges',
          ),
        ),
      ),
      RaisedButton(
        child: Text(
          'Add New',
          style: TextStyle(color: Colors.teal),
        ),
        onPressed: () {
          addItemToList();
        },
      ),
      Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  color: msgCount[index] >= 10
                      ? Colors.blue[400]
                      : msgCount[index] > 3 ? Colors.blue[100] : Colors.grey,
                  child: Center(
                      child: Text(
                    '${names[index]} (${msgCount[index]})',
                    style: TextStyle(fontSize: 18),
                  )),
                );
              }))
    ]));
  }
}
