import 'package:flutter/material.dart';

void main() {
  runApp(const ArtistPage());
}

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class Artist {
  String name;
  String subtitle;
  String description;
  Image imagePath;
  String tag;
  bool isFollowing;
  double imageScale;

  Artist({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.tag,
    this.isFollowing = false,
    this.imageScale = 1.4
  });
}

class _ArtistPageState extends State<ArtistPage> {
  List<Artist> artists = [
    Artist(
      name: "Ronnie James Dio",
      subtitle: "Ronald James Padavona",
      description:
          "Legendary heavy metal vocalist who fronted Elf, Rainbow, Black Sabbath, Dio, and Heaven & Hell. Known for his powerful voice, dramatic stage presence, and major influence on the sound and imagery of heavy metal.",
      imagePath: Image.asset("assets/dio.avif"),
      tag: "Man on the Silver Mountain",
    ),
    Artist(
      name: "Ozzy Osbourne",
      subtitle: "John Michael Osbourne",
      description:
      "Iconic heavy metal singer best known as the original frontman of Black Sabbath and for his successful solo career. Known for his distinctive voice, dark image, and huge influence on metal.",
      imagePath: Image.asset("assets/ozzy.jpg"),
      tag: "Prince of Darkness",
      imageScale: 1.35
    ),
    Artist(
      name: "Rob Halford",
      subtitle: "Robert John Arthur Halford",
      description: "Powerful vocalist of Judas Priest, famous for his wide vocal range, piercing high notes, and commanding stage presence. He helped define both the sound and visual style of classic heavy metal.",
      imagePath: Image.asset("assets/rob.jpg", scale: 1.6,),
      tag: "Metal God",
      imageScale: 1.6
    ),
    Artist(
      name: "Bruce Dickinson",
      subtitle: "Paul Bruce Dickinson",
      description: "Lead singer of Iron Maiden, known for his powerful vocals, energetic live performances, and dramatic storytelling. His voice became a defining part of the band’s classic heavy metal sound.",
      imagePath: Image.asset("assets/bruce.jpg"),
      tag: "The Air Raid Siren",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Godfathers of Heavy Metal",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: const Color(0xFF181818),
        ),
        body: PageView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: const Color(0xFF181818),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Colors.deepPurple, Colors.amber],
                              ),
                            ),
                            height: 250,
                            width: 250,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 260,
                              width: 260,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Transform.scale(
                                scale: artist.imageScale,
                                child: artist.imagePath,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            artist.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            artist.subtitle,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 18),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            width: 190,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF242424),
                              border: Border.all(
                                color: Colors.amber.withValues(alpha: 0.45),
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                artist.tag,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          Center(
                            child: Text(
                              artist.description,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white70,
                                height: 1.4,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(170, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                artist.isFollowing = !artist.isFollowing;
                              });
                            },
                            child: Text(
                              artist.isFollowing ? "Following" : "Follow Now !",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
