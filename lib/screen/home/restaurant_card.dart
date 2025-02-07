import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/model/restaurant.dart';


class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Function() onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.network(
              restaurant.imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        restaurant.location,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite),
                    const SizedBox.square(dimension: 4),
                    Text(restaurant.rating.toString())
                  ],
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            Text(
              restaurant.description,
            ),
          ],
        ),
      )
    );
  }

}