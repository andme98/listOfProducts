import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _ProdsProvider {
  List<dynamic> products = [];
  _ProdsProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/products.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['productos']);
    products = dataMap['productos'];

    return products;
  }
}

final prodsProvider = new _ProdsProvider();
