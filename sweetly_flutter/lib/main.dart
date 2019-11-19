import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
          children: sweets.map((item) => SweetlyListItem(item: item, clickListener: navigateToNative,)).toList()),
    );
  }

  navigateToNative(Sweet item) {
    SystemNavigator.pop();
  }
}

class SweetlyListItem extends StatelessWidget {
  final Sweet item;
  final SweetClick clickListener;

  SweetlyListItem({this.item, this.clickListener, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => clickListener(item),
        child: Card(
            child: Row(children: [
          Expanded(
            flex: 2,
            child: SizedBox(height: 75, child: Image.network(item.urlImage)),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(item.country.toUpperCase(), textAlign: TextAlign.start),
              ],
            ),
          )
        ])));
  }
}

typedef SweetClick(Sweet item);

final List<Sweet> sweets = [
  Sweet("Pastel de Nata", "Portugal",
      "https://www.pingodoce.pt/wp-content/uploads/2016/10/pasteldenata.jpg"),
  Sweet("Esse de Azeitão", "Portugal",
      "http://www.docesregionais.com/wp-content/uploads/2013/06/Esses-de-Azeit%C3%A3o.jpg"),
  Sweet("Dom Rodrigo", "Portugal",
      "https://www.amodadoflavio.pt/wp-content/uploads/2017/05/dom-rodrigo-ok-999x500.jpg"),
];

class Sweet {
  String name;
  String country;
  String urlImage;

  Sweet(this.name, this.country, this.urlImage);
}
