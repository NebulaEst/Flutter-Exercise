
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Jepang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),

        '/pantai': (context) => const DetailPage(
          itemTitle: 'Pantai',
          icon: Icons.beach_access,
          themeColor: Colors.teal,
          imageUrl:
    'https://assets.st-note.com/img/1713834623511-ZMKaBgrGyo.jpg?width=1200',
          description:
              'Pantai di Hokkaido, Jepang menawarkan pesona alam yang unik dan sangat berbeda dari pantai tropis atau wilayah selatan Jepang lainnya.'
              'Alih-alih hanya untuk berjemur, pesisir Hokkaido terkenal dengan tebing-tebing batu yang dramatis, air laut berwarna biru kristal,' 
              'hingga fenomena magis di mana salju musim dingin bertemu langsung dengan bibir pantai.',
        ),

        '/gunung': (context) => const DetailPage(
          itemTitle: 'Gunung',
          icon: Icons.terrain,
          themeColor: Colors.brown,
          
imageUrl:
    'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/97/Mount_Fuji_%28Japan%29.jpg/1280px-Mount_Fuji_%28Japan%29.jpg',
          description:
              'Gunung Fuji (富士山, Fujisan) adalah gunung tertinggi di Jepang dengan ketinggian 3.776 meter.' 
              'Gunung berapi aktif ini terletak di Pulau Honshu,' 
              'tepatnya di perbatasan antara Prefektur Yamanashi dan Shizuoka, sekitar 100 kilometer di sebelah barat daya Tokyo.' 
              'Karena bentuk kerucutnya yang hampir simetris sempurna dan puncaknya yang sering tertutup salju, Gunung Fuji menjadi simbol nasional,'
              'landmark paling ikonik, serta situs Warisan Dunia UNESCO sejak tahun 2013.',
        ),

        '/budaya': (context) => const DetailPage(
          itemTitle: 'Budaya',
          icon: Icons.museum,
          themeColor: Colors.deepOrange,
          imageUrl:
    'https://japannook.com/uploads/medium_hero_a68186c49b.jpg',
          description:
              'Matsuri (祭) adalah istilah dalam bahasa Jepang yang merujuk pada festival atau perayaan budaya.' 
              'Secara historis dan religius dalam ajaran Shinto,' 
              'matsuri merupakan ritual persembahan serta ungkapan rasa syukur kepada Kami (dewa/alam). Namun, dalam konteks sekuler modern,' 
              'matsuri juga mencakup festival komunitas non-religius yang merayakan musim, sejarah, atau keindahan kembang api.',
        ),

        '/kuliner': (context) => const DetailPage(
          itemTitle: 'Kuliner',
          icon: Icons.fastfood,
          themeColor: Colors.amber,
          imageUrl:
    'https://media.delishkitchen.tv/article/2505/pn309fnk9k.jpeg?version=1715645945',
          description:
              'Sushi adalah makanan tradisional khas Jepang yang terdiri dari nasi khusus yang dibumbui cuka, garam, dan gula, lalu dipadukan dengan berbagai bahan lain (neta) seperti makanan laut mentah atau matang, sayuran, telur, hingga daging Jepang.'
              'Kata "sushi" sendiri sebenarnya merujuk pada nasi berasa asam yang menjadi bahan dasarnya, bukan pada ikan mentahnya.',
        ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/pantai');
            },
            icon: const Icon(Icons.beach_access),
            label: const Text('Pantai'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/gunung');
            },
            icon: const Icon(Icons.terrain),
            label: const Text('Gunung'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/budaya');
            },
            icon: const Icon(Icons.museum),
            label: const Text('Budaya'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/kuliner');
            },
            icon: const Icon(Icons.fastfood),
            label: const Text('Kuliner'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final IconData icon;
  final Color themeColor;
  final String imageUrl;
  final String description;

  const DetailPage({
    super.key,
    required this.itemTitle,
    required this.icon,
    required this.themeColor,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        themeColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
        backgroundColor: themeColor,
        foregroundColor: foregroundColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,

              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const SizedBox(
                  height: 260,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 260,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('Gambar gagal dimuat'),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemTitle,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(icon),
                      label: const Text('Kembali'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        foregroundColor: foregroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}