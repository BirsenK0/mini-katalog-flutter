// ürün modeli: json'daki her ürün bu sınıfa çevrilecek
class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final int price;
  final String image;
  final Map<String, String> specs;

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.image,
    required this.specs,
  });

  // json'dan ürün oluşturur
  factory Product.fromJson(Map<String, dynamic> json) {
    // fiyat "$2,499" gibi geliyor, $ ve virgülü silip sayıya çeviriyoruz
    String fiyatYazisi = json['price'].replaceAll('\$', '').replaceAll(',', '');

    // resim adresinden sadece dosya adını alıyoruz, assets klasöründe duruyor
    String resimAdi = json['image'].split('/').last;

    return Product(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      description: json['description'],
      price: int.parse(fiyatYazisi),
      image: 'assets/images/$resimAdi',
      specs: Map<String, String>.from(json['specs']),
    );
  }

  // ürünü tekrar json'a çevirir
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'price': price,
      'image': image,
      'specs': specs,
    };
  }
}
