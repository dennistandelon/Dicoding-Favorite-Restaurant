import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/screen/home/home_screen.dart';
import 'package:submission1_dennistandelon/data/model/dto/restaurant_list_response.dart';

import '../unit_test/restaurant_list_provider_test.mocks.dart';

void main() {
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<RestaurantListProvider>(
      create: (context) => RestaurantListProvider(mockApiServices),
      child: const MaterialApp(home: HomeScreen()),
    );
  }

  testWidgets('Displays error message when API fails', (WidgetTester tester) async {
    when(mockApiServices.getRestaurantList()).thenAnswer((_) async => RestaurantListResponse(error: true, message: "API Error", count: 0, restaurants: []));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text("Sorry, There was an error. Please try again later."), findsOneWidget);
  });

}
