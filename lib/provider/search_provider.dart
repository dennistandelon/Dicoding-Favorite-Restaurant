import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

class SearchProvider extends ChangeNotifier {
 final ApiServices _apiServices;
 final TextEditingController _searchController = TextEditingController();
 
 SearchProvider(
   this._apiServices,
 );
 

 RestaurantListResultState _resultState = RestaurantListNoneState();
 
 RestaurantListResultState get resultState => _resultState;
 TextEditingController get searchController =>_searchController; 
 
 Future<void> fetchSearchList(String searchText) async {
   try {
     _resultState = RestaurantListLoadingState();
     notifyListeners();
 
     final result = await _apiServices.getSearchResults(searchText);
 
     if (result.error) {
       _resultState = RestaurantListErrorState(result.message);
       notifyListeners();
     } else {
       _resultState = RestaurantListLoadedState(result.restaurants);
       notifyListeners();
     }
   } on Exception catch (e) {
     _resultState = RestaurantListErrorState(e.toString());
     notifyListeners();
   }
 }
}