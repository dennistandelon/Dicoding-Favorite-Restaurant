import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/search_provider.dart';
import 'package:submission1_dennistandelon/screen/home/restaurant_card.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<SearchProvider>(
          builder: (context, value, child) {
            return TextField(
              controller: value.searchController,
              decoration: const InputDecoration(
                hintText: "Search Restaurants...",
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.labelMedium,
            );
          },
        ),
        actions: <Widget>[
          Consumer<SearchProvider>(
            builder: (context, value, child) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  context
                      .read<SearchProvider>()
                      .fetchSearchList(value.searchController.text);
                }, // Trigger search on button press
              );
            },
          ),
        ],
      ),
      body: Consumer<SearchProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantListLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            RestaurantListLoadedState(data: var restaurantList) =>
              ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurantList[index];

                  return RestaurantCard(
                    restaurant: restaurant,
                    onTap: () {
                      Navigator.pushNamed(
                          context, NavigationRoute.detailRoute.name,
                          arguments: restaurant.id);
                    },
                  );
                },
              ),
            RestaurantListErrorState() => const Center(
                child:
                    Text("Sorry, There was an error. Please try again later."),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
