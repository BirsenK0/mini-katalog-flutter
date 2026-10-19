import 'package:flutter/material.dart';

import '../models/product.dart';

// listedeki tek bir ürün kartı
class ProductCard extends StatelessWidget {
  final Product urun;
  final VoidCallback onTap; // tıklanınca ne olacağını ana sayfa söylüyor

  const ProductCard({super.key, required this.urun, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // resim kutusu
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(urun.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            urun.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            urun.tagline,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 2),
          Text(
            '\$${urun.price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
