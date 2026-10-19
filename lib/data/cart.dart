import '../models/product.dart';

// sepet burada duruyor, sayfalar buradan okuyor
List<Product> sepet = [];

// sepetteki ürünlerin fiyatlarını toplar
int sepetToplami() {
  int toplam = 0;
  for (var urun in sepet) {
    toplam += urun.price;
  }
  return toplam;
}
