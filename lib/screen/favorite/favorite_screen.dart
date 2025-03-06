import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/database_provider.dart';
import 'package:submission1_dennistandelon/screen/home/restaurant_card.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

class FavoriteScreen extends StatefulWidget{
  const FavoriteScreen({super.key});
  
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<DatabaseProvider>().getFavoriteRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantListLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            RestaurantListLoadedState(data: var restaurantList) => ListView.builder(
                    itemCount: restaurantList.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurantList[index];
                      
                      return RestaurantCard(
                        restaurant: restaurant, 
                        onTap: (){
                          Navigator.pushNamed(
                            context, 
                            NavigationRoute.detailRoute.name, 
                            arguments: restaurant.id
                          );
                        },
                      );
                    },
              ),
            RestaurantListErrorState() => Center(
                child: Text("Sorry, There was no data here. Go make some favorite and back here!"),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}