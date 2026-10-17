import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier{

  final prefs = SharedPreferencesAsync();

  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  String get favoriteStatus => _isFavorite ? "Favorilerimde" : "Favorilerimde Değil";

  Future<void> toggleFavorite() async {

    _isFavorite = !_isFavorite;
    notifyListeners();
    await prefs.setBool('isFavorite', _isFavorite);

  }

  Future<void> loadFavorite() async{
    final getFav = await prefs.getBool('isFavorite') ?? false;
    _isFavorite = getFav;
    notifyListeners();
  }
}