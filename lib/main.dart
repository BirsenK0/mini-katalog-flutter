import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ana sayfa, şimdilik sabit 3 ürün gösteriyor
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Katalog')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ürünler',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ürün kartları
            const Card(
              child: ListTile(
                leading: Icon(Icons.headphones),
                title: Text('Kulaklık'),
                subtitle: Text('Kablosuz'),
                trailing: Text('249 TL'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.watch),
                title: Text('Akıllı Saat'),
                subtitle: Text('Su geçirmez'),
                trailing: Text('1499 TL'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.speaker),
                title: Text('Hoparlör'),
                subtitle: Text('Taşınabilir'),
                trailing: Text('599 TL'),
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                debugPrint('tıklandı');
              },
              child: const Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
