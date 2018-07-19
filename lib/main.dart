import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Entry {
  String name;
  int value = 0;

  Entry(this.name);
}

class _MyHomePageState extends State<MyHomePage> {
  final inputController = TextEditingController();

  final List<Entry> data = <Entry>[
    Entry("appvinio"),
    Entry("Apple"),
    Entry("Google"),
  ];

  void _addItem() {
    setState(() {
      data.add(Entry(inputController.text));
      inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: TextField(
          controller: inputController,
        ),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), //
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry entry) {
    return ListTile(
        title: Text(entry.name),
        leading: Text("${entry.value}"),
        trailing: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(child: Icon(Icons.add)),
            GestureDetector(child: Icon(Icons.remove)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
