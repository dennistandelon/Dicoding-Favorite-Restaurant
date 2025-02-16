import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';


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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 80,
                  minHeight: 80,
                  maxWidth: 120,
                  minWidth: 120,
                ),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ),
            const SizedBox.square(dimension: 16),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox.square(dimension: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    Text(
                      restaurant.location,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox.square(dimension: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 14,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
           ),
          ],
        ),
      )
    );
  }

}