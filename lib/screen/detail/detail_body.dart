import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';
import 'package:submission1_dennistandelon/data/model/restaurant_detail.dart';
import 'package:submission1_dennistandelon/provider/database_provider.dart';

class DetailBody extends StatelessWidget {
  final RestaurantDetail restaurant;

  const DetailBody({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return _buildBody(context, provider, provider.isFavorite);
      },
    );
  }

  Widget _buildBody(BuildContext context, DatabaseProvider provider, bool isFavorite) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: restaurant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      restaurant.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return const Icon(Icons.error_outline);
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: isFavorite
                      ? FloatingActionButton(
                          onPressed: () {
                            provider.removeFavorite(restaurant.id);
                            provider.getFavoriteRestaurants();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text(
                                  'Removed from Favorite',
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.favorite,
                            size: 28,
                          ),
                        )
                      : FloatingActionButton(
                          onPressed: () {
                            provider.addFavorite(
                              Restaurant(
                                id: restaurant.id,
                                name: restaurant.name,
                                description: restaurant.description,
                                location: restaurant.location,
                                imageUrl: restaurant.imageUrl,
                                rating: restaurant.rating,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Added to Favorite',
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.favorite_border,
                            size: 28,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "${restaurant.location}, ${restaurant.city}",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox.square(dimension: 6),
                Text(
                  restaurant.rating.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                restaurant.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              "Menu",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox.square(dimension: 16),
            SizedBox(
              height: 200,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.menus.drinks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(restaurant.menus.drinks[index].name),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.menus.foods.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(restaurant.menus.foods[index].name),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              "Review",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox.square(dimension: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: restaurant.customerReviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(restaurant.customerReviews[index].name),
                  subtitle: Text(restaurant.customerReviews[index].review),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
