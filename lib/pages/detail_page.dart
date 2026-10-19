import 'package:flutter/material.dart';

import '../data/cart.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ana sayfadan gönderilen ürünü route argümanından alıyoruz
    final urun = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(urun.name)),
      body: Center(
        // geniş ekranda çok yayılmasın
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                height: 280,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(urun.image, fit: BoxFit.contain),
              ),
              const SizedBox(height: 16),
              Text(
                urun.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(urun.tagline, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 10),
              Text(
                '\$${urun.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB5543C),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Açıklama',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(urun.description, style: const TextStyle(height: 1.5)),
              const SizedBox(height: 20),
              const Text(
                'Özellikler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),

              // özellikleri satır satır yazdırıyoruz
              for (var e in urun.specs.entries)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text(
                          e.key,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                      Expanded(child: Text(e.value)),
                    ],
                  ),
                ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  sepet.add(urun);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${urun.name} sepete eklendi'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Sepete Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
