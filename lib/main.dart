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
  Entry(this.name);
  String name;
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
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(data[index].name),
          ),
          itemCount: data.length),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), //
    );
  }
}
