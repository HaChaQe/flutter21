List<String> bands = [
  "Dio",
  "Black Sabbath",
  "Rainbow",
  "Iron Maiden",
  "Rush",
  "Metallica",
];

List<String> albums = [
  "Holy Diver",
  "Heaven and Hell",
  "Mob Rules",
  "Dream Evil",
];

List<String> artists = [
  "Dio",
  "Ozzy",
  "Bruce Dickinson",
  "Rob Halford",
  "Ronnie James Dio"
];

void main () {
  // final filtered = bands.where((b)=> b.length > 6);
  // print(filtered.toList());

  // final List<int> lengths = albums.map((album) => album.length).toList();
  // print(lengths);

  final bruce = artists.firstWhere((a) => a.startsWith("Bruce"));
  print(bruce);
  final james = artists.firstWhere(
    (a) => a.contains("James"),
    orElse: () {
      return "Unknow Artist";
    },
  );
  print(james);

}