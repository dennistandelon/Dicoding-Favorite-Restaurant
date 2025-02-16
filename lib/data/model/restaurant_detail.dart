import 'package:submission1_dennistandelon/data/model/category.dart';
import 'package:submission1_dennistandelon/data/model/menus.dart';
import 'package:submission1_dennistandelon/data/model/customer_review.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String location;
  final String imageUrl;
  List<Category> categories;
  Menus menus;
  final double rating;
  List<CustomerReview> customerReviews;

  RestaurantDetail(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.city,
        required this.location,
        required this.imageUrl,
        required this.categories,
        required this.menus,
        required this.rating,
        required this.customerReviews
      }
    );

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    
    return RestaurantDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        location: json["address"],
        imageUrl: "https://restaurant-api.dicoding.dev/images/small/${json["pictureId"]}",
        rating: json["rating"].toDouble(),
        categories: json["categories"] != null ? List<Category>.from(json["categories"].map((x) => Category.fromJson(x))): [],
        menus:  Menus.fromJson(json["menus"]),
        customerReviews: json["customerReviews"] != null ? List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))) : [],
      );
    }
}