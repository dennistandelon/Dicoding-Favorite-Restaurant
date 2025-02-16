import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/model/restaurant_detail.dart';

class DetailBody extends StatelessWidget{
  final RestaurantDetail restaurant;

  const DetailBody({super.key, required this.restaurant});
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:Image.network(
                  restaurant.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              restaurant.location,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              restaurant.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox.square(dimension: 16),
            // Text(
            //   "Menu",
            //   style: const TextStyle(
            //     fontSize: 18,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}