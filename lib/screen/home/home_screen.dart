import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/model/restaurant_list_response.dart';
import 'package:submission1_dennistandelon/screen/home/restaurant_card.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantListResponse> _futureRestaurantList;

  @override
  void initState() {
    super.initState();
    _futureRestaurantList = ApiServices().getRestaurantList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant List"),
      ),
      body: FutureBuilder(
       future: _futureRestaurantList,
       builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
  
              final listOfRestaurant = snapshot.data!.restaurants;
              return ListView.builder(
                itemCount: listOfRestaurant.length,
                itemBuilder: (context, index) {
                  final restaurant = listOfRestaurant[index];

                  return RestaurantCard(
                    restaurant: restaurant, 
                    onTap: (){
                      Navigator.pushNamed(
                        context, 
                        NavigationRoute.detailRoute.name, 
                        arguments: restaurant
                      );
                    },
                  );
                },
              );
            default:
              return const SizedBox();
          }
       },
     ),
      
    );
  }
}