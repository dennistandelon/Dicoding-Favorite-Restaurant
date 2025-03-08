import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/provider/restaurant_detail_provider.dart';
import 'package:submission1_dennistandelon/screen/detail/detail_body.dart';
import 'package:submission1_dennistandelon/static/restaurant_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Detail"),
      ),
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantDetailLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            RestaurantDetailLoadedState(data: var restaurant) =>
              DetailBody(restaurant: restaurant),
            RestaurantDetailErrorState() => const Center(
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
