import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/screen/home/restaurant_card.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {      
      if (!mounted) return;
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: Consumer<RestaurantListProvider>(
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
