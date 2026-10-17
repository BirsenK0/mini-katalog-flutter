import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/product.dart';

// assets içindeki json dosyasını okuyup ürün listesi döndürür
Future<List<Product>> urunleriYukle() async {
  String yazi = await rootBundle.loadString('assets/products.json');
  Map<String, dynamic> veri = jsonDecode(yazi);

  // ürünler "data" listesinin içinde
  List<dynamic> liste = veri['data'];

  return liste.map((e) => Product.fromJson(e)).toList();
}
