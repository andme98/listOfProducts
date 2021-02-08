import 'package:flutter/material.dart';
import 'package:own_it/providers/prods_provider.dart';

class ProductsList extends StatefulWidget {
  ProductsList({Key key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final productos = [
    new ObjectToShow('Anime Poster', 'Poster para Valentin', 300.00),
    new ObjectToShow('Anime VTuber 1', 'Virtual girl para Valentin', 1200.00),
    new ObjectToShow('Anime VTuber 2', 'Virtual girl para Valentin', 1250.00),
    new ObjectToShow('Anime VTuber 3', 'Virtual girl para Valentin', 13000.00),
    new ObjectToShow('Anime VTuber 4', 'Virtual girl para Valentin', 1350.00),
    new ObjectToShow('Anime VTuber 5', 'Virtual girl para Valentin', 1400.00),
    new ObjectToShow('Anime VTuber 6', 'Virtual girl para Valentin', 1450.00),
    new ObjectToShow('Anime VTuber 7', 'Virtual girl para Valentin', 1500.00),
    new ObjectToShow('Anime VTuber 8', 'Virtual girl para Valentin', 1550.00),
    new ObjectToShow('Anime VTuber 9', 'Virtual girl para Valentin', 1600.00),
    new ObjectToShow('Anime VTuber 10', 'Virtual girl para Valentin', 1650.00),
    new ObjectToShow('Real Woman 3D', 'Real girl para Valentin', 00.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: _lista(),
      //Center(
      //child:
      //ListView(
      //  children: , //_crearListaProductos(),
      //),
      //),
    );
  }

  Widget _lista() {
    //print(prodsProvider.products);
    //prodsProvider.cargarData();
    return FutureBuilder(
      future: prodsProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print('builder');
        //print(snapshot.data);
        //return Text(snapshot.data.toString());
        return ListView(
          children: _listaProdItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaProdItems(List<dynamic> data) {
    final List<Widget> productos = [];
    data.forEach((prod) {
      final widgetTemp = _contentCardTwo(prod);
      print(prod);
      productos..add(widgetTemp)..add(Divider());
    });
    return productos;
  }

  List<Widget> _crearListaProductos() {
    List<Widget> listaProd = new List<Widget>();
    for (ObjectToShow prod in productos) {
      final temporalWidget = _contentCard(prod);
      listaProd.add(temporalWidget);
    }
    return listaProd;
  }

  Widget _contentCardTwo(dynamic d) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/japan.jpg',
                    height: 80,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 0.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        d['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(d['description']),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'USD ' + d['price'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      _poolOfButtons(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentCard(ObjectToShow object) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/japan.jpg',
                    height: 80,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 0.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        object._name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(object._description),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'USD ' + object._price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      _poolOfButtons(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _poolOfButtons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Icon(Icons.add),
            color: Colors.green[300],
          ),
          RaisedButton(
            onPressed: () {},
            child: Icon(Icons.remove),
            color: Colors.red[300],
          ),
        ],
      ),
    );
  }
}

class ObjectToShow {
  String _name;
  String _description;
  double _price;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  ObjectToShow(this._name, this._description, this._price);
}
