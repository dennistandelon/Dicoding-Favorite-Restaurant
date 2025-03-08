class Restaurant {
  final String id;
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    String imgUrl = json["imageUrl"] ??
        "https://restaurant-api.dicoding.dev/images/small/${json["pictureId"]}";

    final restaurant = Restaurant(
      id: json["id"],
      name: json["name"],
      location: json["location"] ?? json["city"],
      description: json["description"],
      imageUrl: imgUrl,
      rating: json["rating"].toDouble(),
    );

    return restaurant;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "location": location,
      "description": description,
      "imageUrl": imageUrl,
      "rating": rating,
    };
  }
}
