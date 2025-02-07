import 'package:submission1_dennistandelon/model/menu.dart';

class Restaurant {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;
  List<Menu> menus = [];

  Restaurant({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

}

final List<Restaurant> restaurants = [
  Restaurant(
    name: "Kafein",
    location: "Jl. Raya Darmo Permai III No. 1, Dukuh Menanggal, Kec. Gayungan, Kota SBY, Jawa Timur 60234",
    description: "Kafein adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.5,
  ),
  Restaurant(
    name: "Kedai Kopi Kulo",
    location: "Jl. Raya Darmo Permai III No. 1, Dukuh Menanggal, Kec. Gayungan, Kota SBY, Jawa Timur 60234",
    description: "Kedai Kopi Kulo adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.5,
  ),
  Restaurant(
    name: "Maid Cafe",
    location: "Jl. teyvat raya 2, Mondstadt, Liyue, Teyvat",
    description: "Maid Cafe adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.9,
  ),
  Restaurant(
    name: "Kedai Kopi Kulo",
    location: "Jl. Raya Darmo Permai III No. 1, Dukuh Menanggal, Kec. Gayungan, Kota SBY, Jawa Timur 60234",
    description: "Kedai Kopi Kulo adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.5,
  ),
  Restaurant(
    name: "Maid Cafe",
    location: "Jl. teyvat raya 2, Mondstadt, Liyue, Teyvat",
    description: "Maid Cafe adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.9,
  ),
  Restaurant(
    name: "Kedai Kopi Kulo",
    location: "Jl. Raya Darmo Permai III No. 1, Dukuh Menanggal, Kec. Gayungan, Kota SBY, Jawa Timur 60234",
    description: "Kedai Kopi Kulo adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.5,
  ),
  Restaurant(
    name: "Maid Cafe",
    location: "Jl. teyvat raya 2, Mondstadt, Liyue, Teyvat",
    description: "Maid Cafe adalah tempat nongkrong yang nyaman dan asik. Tempat ini cocok untuk kamu yang ingin menikmati kopi sambil bekerja atau sekadar bersantai.",
    imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/0f/7b/0d/7b/kafein.jpg",
    rating: 4.9,
  ),
];