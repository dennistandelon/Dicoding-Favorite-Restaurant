import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/static/restaurant_detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
 final ApiServices _apiServices;
 
 RestaurantDetailProvider(
   this._apiServices,
 );
 
 RestaurantDetailResultState _resultState = RestaurantDetailNoneState();
 
 RestaurantDetailResultState get resultState => _resultState;
 
 Future<void> fetchRestaurantDetail(String id) async {
   try {
     _resultState = RestaurantDetailLoadingState();
     notifyListeners();
 
     final result = await _apiServices.getRestaurantDetail(id);
 
     if (result.error) {
       _resultState = RestaurantDetailErrorState(result.message);
       notifyListeners();
     } else {
       _resultState = RestaurantDetailLoadedState(result.restaurantDetail);
       notifyListeners();
     }
   } on Exception catch (e) {
     _resultState = RestaurantDetailErrorState(e.toString());
     notifyListeners();
   }
 }
}