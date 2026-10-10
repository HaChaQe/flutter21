// ignore_for_file: avoid_print

// class Instrument {
//   String name;

//   Instrument(this.name);

//   void play (){
//     print("Playing instrument $name");
//   }
// }

// class Guitar extends Instrument {
//   int strings;

//   Guitar(String name, this.strings) : super(name);

//   @override
//   void play (){
//     print("Playing guitar $name with $strings strings..");
//   }
// }

// abstract class Musician {
//   String name;

//   Musician(this.name);

//   void perform();
// }

// class Drummer extends Musician{
//   Drummer(super.name);

//   void perform(){
//     print("$name is playing drums!");
//   }
// }

abstract class PaymentMethod {
  void pay(double amount);
}

class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid $amount in cash!");
  }
}

void main(){
  // final mymy = Guitar("Fender Stratocaster", 8,);
  // mymy.play();

  // final lars = Drummer("Lars Ulrich");
  // lars.perform();

  // final cash1 = CashPayment();
  // cash1.pay(154.3);

  // String? favoriteArtist;

  // print(favoriteArtist ?? "No favorite artist");

  // favoriteArtist = "Dio";

  // print(favoriteArtist ?? "No favorite artist");

  String? album = null;

  print(album?.length ?? 0);
  album = "Heaven and Hell";
  print(album.length);
}