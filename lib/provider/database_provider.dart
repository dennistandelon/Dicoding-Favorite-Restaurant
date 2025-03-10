import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/database/sqlite_service.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final SqliteService _service;

  DatabaseProvider(this._service) {
    getFavoriteRestaurants();
  }

  String _message = "";
  String get message => _message;

  RestaurantListResultState _resultState = RestaurantListNoneState();
  RestaurantListResultState get resultState => _resultState;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  Future<void> checkFavoriteStatus(String id) async {
    final result = await _service.getItemById(id);
    _isFavorite = result != null;
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await _service.insertFavorite(restaurant.toJson());
      _message = "Added to Favorite";
      _isFavorite = true;
    } catch (e) {
      _message = "Failed to add to Favorite";
    }
    notifyListeners();
  }

  void removeFavorite(String id) async {
    try {
      await _service.removeItem(id);
      _message = "Restaurant removed";
      _isFavorite = false;
    } catch (e) {
      _message = "Failed to remove restaurant";
    }
    notifyListeners();
  }

  void getFavoriteRestaurants() async {
    try {
      _resultState = RestaurantListLoadingState();
      notifyListeners();

      final result = await _service.getFavorites();

      if (result.isEmpty) {
        _resultState = RestaurantListErrorState("No Data");
      } else {
        _resultState = RestaurantListLoadedState(result);
      }
    } catch (e) {
      _resultState = RestaurantListErrorState(e.toString());
    }
    notifyListeners();
  }
}
