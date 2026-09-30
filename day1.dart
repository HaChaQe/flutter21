// class Song {
//   String name;
//   String band;
//   int sellingMillion;
//   bool isListen;

//   Song({
//     required this.name,
//     required this.band,
//     required this.sellingMillion,
//     this.isListen = false,
//   });
// }

// List<Song> songs = [
//   Song(name: "Catch the Rainbow", band: "Rainbow", sellingMillion: 100),
//   Song(name: "Heaven and Hell", band: "Black Sabbath", sellingMillion: 135),
//   Song(name: "Last in Line", band: "Dio", sellingMillion: 86, isListen: true),
// ];

// final songListen = songs.where((song) => song.isListen).toList();

// void main () {
//     print("\n Legendary Song: " + songListen[0].name);
// }

//-----------------------------------------------------------
// void main() {
//     print("------ALL---------");
//     for (var i = 0; i < songs.length; i++) {
//       print(songs[i].title);
//     }

//     print("------LISTEN---------");
//     for (var i = 0; i < songListen.length; i++) {
//       print(songs[i].title);
//     }

//     print("------AFTER 2000---------");
//     for (var i = 0; i < songNew.length; i++) {
//       print(songs[i].artist);
//     }
//     print("------TITLES---------");
//     for (var i = 0; i < songName.length; i++) {
//       print(songs[i].title);
//     }
// }

// class Song {
//   String title;
//   String artist;
//   int year;
//   bool isListen;

//   Song({
//     required this.title,
//     required this.artist,
//     required this.year,
//     this.isListen = false,
//   });
// }

// final songs = [
//     Song(title: "SongA", artist: "Artist A", year: 1800, isListen: true),
//     Song(title: "SongB", artist: "Artist B", year: 2013),
//     Song(title: "SongC", artist: "Artist C", year: 2000),
//     Song(title: "SongB", artist: "Artist D", year: 1985,isListen: true),
//     Song(title: "SongC", artist: "Artist E", year: 2010),
// ];

// final songListen = songs.where((song) => song.isListen).toList();

// final songNew = songs.where((song) => song.year > 2000).toList();

// final songName = songs.map((song)=> song.title).toList();
//-----------------------------------------------------------


// void main() {
//   final names = ["Dio", "Tony", "Ritchie", "Jimmy"];

//   for (var i = 0; i < names.length; i++) {
//     if (names[i].length > 4) {
//       print(names[i]);
//     }
//   }
// }

// void main() {
//   final names = ["Dio", "Tony", "Ritchie", "Jimmy"];

//   final List<String> longNames = names.where((name) => name.length > 4).toList();

//   print(longNames);

// }

// void main() {
//     String? name = "AAAA";

//     if(name != null)
//     {
//         print(name.length);
//     };
// }

// void main(){
//     print(calculateAge(2004));
//     introduce(name: "Çağdaş", age: 22);
//     printName("Ronnie");
// }

// int calculateAge (int birthYear) => 2026 - birthYear;

// void introduce ({required String name, required int age}) {
//     print("My name is $name and I am $age years old.");
// }

// void printName (String? name) {
//     print("Hello ${name ?? "Stranger"}.");
// }

class Book {
  String title;
  String author;
  bool isRead;

  Book({
    required this.title,
    required this.author,
    this.isRead = false
  });
}

List<Book> books = [
    Book(title: "The Hobbit", author: "author1", isRead: true),
    Book(title: "Dune", author: "author2"),
    Book(title: "The Lord of the Rings", author: "author3", isRead: true),
    Book(title: "The Name of the Wind", author: "author4"),
].toList();

final bookNames = books.map((book) => book.title).toList();

List<Book> getReadBooks(){
    final readBook = books.where((book) => book.isRead).toList();
    return readBook;
}

void printBook(Book book){
      if (book.isRead) {
        print("${book.title} - ${book.author} [Read]");
      } else {
        print("${book.title} - ${book.author} [Not read]");
      }
}

Book? findBook(String name) {

    print("===========FIND BOOK============");
    print("Searching for: $name");
    print("Total books: ${books.length}");

    for (var book in books) {
        print("Checking: ${book.title}");
      if (book.title == name) {
        print("${book.title} found!");
        print("Author: ${book.author}");
        print("Do you read?: ${book.isRead}");
        print("==========================");
        return book;
      }
    }

    print("NOT FOUND");
    print("==========================");
    return null;
}

void main () {

    for (var book in books) {
      printBook(book);
    }

    final readBookPrint = getReadBooks();
    for (var book in readBookPrint) {
      printBook(book);
    }

    final book1 = findBook("Dune");

    if (book1 != null) {
    printBook(book1);
    }

    final book2 = findBook("Harry Potter");

    if (book2 != null) {
    printBook(book2);
    }

}