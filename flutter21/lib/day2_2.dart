import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '21 days of Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class ArtistTag {
  final String name;
  final IconData icon;
  final Color color;

  ArtistTag({
    required this.name,
    required this.icon,
    required this.color
  });
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<ArtistTag> tags = [
    ArtistTag(name: "Dreamer", icon: Icons.cloud, color: Colors.white),
    ArtistTag(name: "Metal", icon: FontAwesomeIcons.boltLightning, color: Colors.yellow),
    ArtistTag(name: "Vocalist", icon: Icons.mic_external_on_outlined, color: Colors.blueAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: const Icon(Icons.keyboard_return_outlined, color: Colors.white),
        actions: const [
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, // 1) ortalandı
          children: [
            Stack(
              children: [
                // 2) Dıştaki Container renkli çerçeve görevi görüyor
                Container(
                  height: 250,
                  width: 250,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.deepOrange],
                    ),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Transform.scale(
                      scale: 1.1,
                      child: Image.asset(
                        "assets/dio_rest.png",
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 6,
                  right: 25,
                  child: FaIcon(
                    FontAwesomeIcons.boltLightning,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 32,
                  child: FaIcon(
                    FontAwesomeIcons.boltLightning,
                    size: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Ronnie James Dio",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Godfather of Heavy Metal",
              style: TextStyle(fontSize: 16, color: Color(0xFFB3B3B3)),
            ),
            const SizedBox(height: 16),
            // 3) day3te yapılan listview builder yapısı.
            SizedBox(
              height: 55,
              child: PageView.builder(
                itemCount: tags.length,
                itemBuilder: (context, index) {
                  final tag = tags[index];
                  return Center(
                    child: Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: tag.color
                        )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(tag.icon, color: tag.color, size: 20),
                          const SizedBox(width: 8),
                          Text(tag.name, style: TextStyle(color: tag.color)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Divider(thickness: 1, color: Colors.white24),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About Artist",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Formed Elf with his cousins. Formed Rainbow with Ritchie Blackmore. "
              "Joined Black Sabbath. Formed DIO. Rejoined Black Sabbath. "
              "Returned DIO. Formed Heaven & Hell. Passed away on May 16, 2010.",
              style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 28),
            // 4) Buton tam genişlik ve yuvarlak
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "FOLLOW NOW!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}