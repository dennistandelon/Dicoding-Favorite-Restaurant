import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/model/restaurant.dart';
import 'package:submission1_dennistandelon/screen/home/restaurant_card.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant List"),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return RestaurantCard(restaurant: restaurant,);
        },
      ),
    );
  }
}