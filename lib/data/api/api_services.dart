import 'dart:convert';
import 'package:submission1_dennistandelon/data/model/dto/restaurant_detail_response.dart';
import 'package:submission1_dennistandelon/data/model/dto/restaurant_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      RestaurantDetailResponse data =
          RestaurantDetailResponse.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantListResponse> getSearchResults(String searchText) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/search?q=$searchText"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load search results for restaurant");
    }
  }
}
