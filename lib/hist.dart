import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> historyItems = [];
  final TextEditingController itemController = TextEditingController();

  void addItemToHistory() {
    setState(() {
      String newItem = itemController.text;
      if (newItem.isNotEmpty) {
        historyItems.add(newItem);
        itemController.clear();
      }
    });
  }

  void removeItemFromHistory(int index) {
    setState(() {
      historyItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        backgroundColor: const Color.fromARGB(255, 29, 27, 27),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(historyItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeItemFromHistory(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: itemController,
                    decoration: InputDecoration(labelText: 'Salvar valor'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addItemToHistory,
                  splashColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
