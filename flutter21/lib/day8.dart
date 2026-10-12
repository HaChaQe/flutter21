
// Future<String> getAlbum() async {

//   return await Future.delayed(
//     Duration(seconds: 1),
//     () => "Holy Diver"
//   );
// }

// Future<String> getArtist() async {
//   return await Future.delayed(
//     Duration(seconds: 1),
//     () => throw Exception("Sunucuya bağlanılamadı")
//   );
// }

// Future<String> getSong(bool isConnected) async{
//   return await Future.delayed(
//     Duration(seconds: 2),
//     () {
//       if(isConnected == true){
//         return "Rainbow in the Dark";
//       } else {
//         throw Exception("İnternet bağlantısı yok!");
//       }
//     }
    
//   );
// }

// void main() async {
//   print("Albüm aranıyor...");
//   String album = await getAlbum();
//   print(album);

  // try {
  //   print("Sanatçı aranıyor..");
  //   String artist = await getArtist();
  //   print(artist);
  // } catch (e) {
  //   print("Hata: $e");
  // } finally {
  //   print("İşlem tamamlandı");
  // }

//   try {
//     String song = await getSong(false);
//     print(song);

//     String song2 = await getSong(true);
//     print(song2);
//   } catch (e) {
//     print("Hata: $e");
//   } finally {
//     print("İşlem Tamamlandı");
//   }

//   try {
//     String song2 = await getSong(true);
//     print(song2);
//   } catch (e) {
//     print("Hata: $e");
//   } finally {
//     print("İşlem Tamamlandı");
//   }

// }

Future<String> fetchSong(bool hasError) async{
 return await Future.delayed(
  Duration(seconds: 2),
  () {
    if(hasError){
      throw Exception("Şarkı yüklenemedi!");
    } else {
      return "Stargazer";
    }
  },
 );
}

// void main() async{
//   try {
//     print("Şarkı yükleniyor..");
//     String song = await fetchSong(false);
//     print(song);
//   } catch (e) {
//     print("Hata: $e");
//   } finally {
//     print("İstek sona erdi!");
//   }

//   try {
//     print("Şarkı yükleniyor..");
//     String song = await fetchSong(true);
//     print(song);
//   } catch (e) {
//     print("Hata: $e");
//   } finally {
//     print("İstek sona erdi!");
//   }
// }

Future<void> taskA() async {
  await Future.delayed(Duration(seconds: 2));
  print("A tamamlandı!");
}

Future<void> taskB() async {
  await Future.delayed(Duration(seconds: 1));
  print("B tamamlandı!");
}


void main() async {
  print("Başlangıç");

  List<void> results = await Future.wait([
    taskA(),
    taskB(),
  ]);

  print(results);
  print("Bitiş");
}