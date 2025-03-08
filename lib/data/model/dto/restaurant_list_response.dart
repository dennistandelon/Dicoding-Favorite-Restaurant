import 'package:submission1_dennistandelon/data/model/restaurant.dart';

class RestaurantListResponse {
  final bool error;
  final int count;
  final List<Restaurant> restaurants;
  final String message;

  RestaurantListResponse({
    required this.error,
    required this.restaurants,
    required this.count,
    required this.message,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListResponse(
      error: json["error"],
      message: json["message"] ?? "",
      count: json["count"] ?? json["founded"] ?? 0,
      restaurants: json['restaurants'] != null
          ? List<Restaurant>.from(json["restaurants"]!
              .map((restaurant) => Restaurant.fromJson(restaurant)))
          : <Restaurant>[],
    );
  }
}
