// import 'package:flutter/material.dart';
// import 'package:submission1_dennistandelon/model/restaurant.dart';
 
// class DetailPage extends StatelessWidget {
//  final Restaurant Restaurant;
 
//  const DetailPage({
//    super.key,
//    required this.Restaurant,
//  });
 
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text("Restaurant Detail"),
//      ),
//      body: SingleChildScrollView(
//        child: Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: Column(
//            children: [
//              Image.network(
//                Restaurant.imageUrl,
//                fit: BoxFit.cover,
//              ),
//              const SizedBox.square(dimension: 16),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Expanded(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(
//                          Restaurant.name,
//                          style: const TextStyle(fontSize: 18),
//                        ),
//                        Text(
//                          Restaurant.address,
//                          style: const TextStyle(
//                            fontSize: 12,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Row(
//                    children: [
//                      const Icon(Icons.favorite),
//                      const SizedBox.square(dimension: 4),
//                      Text(Restaurant.rating.toString())
//                    ],
//                  ),
//                ],
//              ),
//              const SizedBox.square(dimension: 16),
//              Text(
//                Restaurant.description,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
// }