import 'package:flutter/material.dart';

import '../data/cart.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> tumUrunler = []; // json'dan gelen hepsi
  List<Product> gorunenler = []; // ekranda gösterilen

  @override
  void initState() {
    super.initState();
    urunleriGetir();
  }

  // veriyi okuyup iki listeye de koyuyoruz
  void urunleriGetir() async {
    var liste = await urunleriYukle();
    setState(() {
      tumUrunler = liste;
      gorunenler = liste;
    });
  }

  // arama kutusuna yazdıkça listeyi süz
  void ara(String yazi) {
    setState(() {
      gorunenler = tumUrunler
          .where((u) => u.name.toLowerCase().contains(yazi.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Katalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // sepete gidip dönünce sayı güncellensin diye setState çağırıyoruz
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/sepet',
              ).then((_) => setState(() {}));
            },
            child: Text(
              'Sepet (${sepet.length})',
              style: const TextStyle(color: Color(0xFF222222)),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // arama kutusu
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: TextField(
              onChanged: ara,
              decoration: InputDecoration(
                hintText: 'Ürün ara',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/banner.png',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ürün listesi
          Expanded(child: urunAlani()),
        ],
      ),
    );
  }

  // yükleniyor, bulunamadı ve grid durumlarını ayırdım
  Widget urunAlani() {
    if (tumUrunler.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (gorunenler.isEmpty) {
      return const Center(child: Text('Ürün bulunamadı'));
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemCount: gorunenler.length,
      itemBuilder: (context, index) {
        return ProductCard(
          urun: gorunenler[index],
          onTap: () {
            // ürünü detay sayfasına argüman olarak gönderiyoruz
            Navigator.pushNamed(
              context,
              '/detay',
              arguments: gorunenler[index],
            ).then((_) => setState(() {}));
          },
        );
      },
    );
  }
}
