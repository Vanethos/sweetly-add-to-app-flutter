import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // This call ensures the Flutter binding has been set up before creating the
  // MethodChannel-based model.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF008577),
        primaryColorDark: Color(0xFF00574B)
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
  // Handle Native messages
  final _channel = MethodChannel('com.vanethos.sweetly/flutter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Treat!"),
      ),
      body: ListView(
          children: sweets
              .map((item) => SweetlyListItem(
                    item: item,
                    clickListener: navigateToNative,
                  ))
              .toList()),
    );
  }

  navigateToNative(Sweet item) async {
    await _channel.invokeMethod('goToDetail', <String, String>{
      'name': item.name,
      'country': item.country,
      'image': item.urlImage
    });
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
            child: SizedBox(height: 75, child: Image.network(item.urlImage, fit: BoxFit.cover,)),
          ),
          Spacer(),
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
  Sweet("Pastel de Nata (Cream Pastry)", "Portugal",
      "https://www.pingodoce.pt/wp-content/uploads/2016/10/pasteldenata.jpg"),
  Sweet("Esse de Azeitão (S from Azeitão)", "Portugal",
      "https://pt.rc-cdn.community.thermomix.com/recipeimage/l9h1idk3-886f4-208576-cfcd2-5fmaaqw4/34626e30-feb0-4510-8aff-bbca224c4405/main/bolachas-tipo-esses-de-azeitao.jpg"),
  Sweet("D. Rodrigo", "Portugal",
      "https://www.amodadoflavio.pt/wp-content/uploads/2017/05/dom-rodrigo-ok-999x500.jpg"),
];

class Sweet {
  String name;
  String country;
  String urlImage;

  Sweet(this.name, this.country, this.urlImage);
}
