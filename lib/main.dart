import 'package:own_it/pages/home_page.dart';
import 'package:own_it/pages/products_list.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MainPage(),
      //home: ProductsList(),
    );
  }
}
