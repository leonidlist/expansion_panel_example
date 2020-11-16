import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MyItem {
  bool isExpaneded;
  final String header;
  final Widget body;

  MyItem({this.header, this.body, this.isExpaneded});
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<MyItem> _items = List<MyItem>();

  @override
  void initState() {
    for(int i = 0; i < 10; i++) {
       _items.add(MyItem(
         isExpaneded: false,
         header: "Item $i",
         body: Container(
           padding: EdgeInsets.all(10),
           child: Text(
             'Hola, Im descr!!!'
           ),
         )
       ));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Text(
            'Header ${item.header}'
          ),
        );
      },
      body: item.body,
      isExpanded: item.isExpaneded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(32),
      child: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                _items[index].isExpaneded = !_items[index].isExpaneded;
              });
            },
            children: _items.map(_createItem).toList(), 
          )
        ],
      ),
    );
  }
}