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
              restaurant.location + ", " + restaurant.city,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox.square(dimension: 16),           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox.square(dimension: 6),
                Text(
                  restaurant.rating.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
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
            SizedBox ( 
              height:200,
              child : Row(
                children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: restaurant.menus.drinks.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(restaurant.menus.drinks[index].name),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child:ListView.builder(
                        shrinkWrap: true,
                        itemCount: restaurant.menus.foods.length,
                        itemBuilder: (context, index){
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
              itemBuilder: (context, index){
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