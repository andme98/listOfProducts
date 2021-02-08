import 'package:flutter/material.dart';
import 'package:own_it/pages/products_list.dart';
import 'package:own_it/providers/prods_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        /*appBar: AppBar(
          title: Text('Princip<AL> for V<AL>entin'),
          centerTitle: true,
        ),
        */
        body: Center(
          child: new ProductsList(),
        ),
      ),
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
          children: _listaItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data) {
    final List<Widget> productos = [];
    data.forEach((prod) {
      final widgetTemp = ListTile(
        title: Text(prod['name']),
        leading: Icon(
          Icons.animation,
          color: Colors.blueAccent,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blueAccent,
        ),
        onTap: () {},
      );
      print(prod);
      productos..add(widgetTemp)..add(Divider());
    });
    return productos;
  }
}
