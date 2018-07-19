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

  void _incrementItemValue(Entry entry) {
    setState(() {
      entry.value++;
      data.sort((first, second) => second.value.compareTo(first.value));
    });
  }

  void _decrementItemValue(Entry entry) {
    setState(() {
      entry.value--;
      data.sort((first, second) => second.value.compareTo(first.value));
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
              EntryItem(data[index], _incrementItemValue, _decrementItemValue),
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
  const EntryItem(this.entry, this.addItemValue, this.removeItemValue);

  final Entry entry;
  final Function addItemValue;
  final Function removeItemValue;

  Widget _buildTiles(Entry entry) {
    return ListTile(
        title: Text(entry.name),
        leading: Text("${entry.value}"),
        trailing: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  addItemValue(entry);
                },
                child: Icon(Icons.add)),
            GestureDetector(
                onTap: () {
                  removeItemValue(entry);
                },
                child: Icon(Icons.remove)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
