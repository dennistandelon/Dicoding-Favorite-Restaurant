import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  
  const DetailScreen({
    super.key,
    required this.restaurant,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              restaurant.imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox.square(dimension: 16),
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
            const SizedBox.square(dimension: 16),
            Text(
              restaurant.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              "Menu",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}