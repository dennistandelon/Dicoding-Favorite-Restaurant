import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/data/model/dto/restaurant_list_response.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/screen/home/home_screen.dart';

import '../test/unit_test/restaurant_list_provider_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockApiServices mockApiServices;
  late RestaurantListProvider provider;

  setUp(() {
    mockApiServices = MockApiServices();
    provider = RestaurantListProvider(mockApiServices);
  });

  Widget createTestApp() {
    return ChangeNotifierProvider<RestaurantListProvider>.value(
      value: provider,
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }

  testWidgets('Displays loading indicator when fetching data', (WidgetTester tester) async {
    when(mockApiServices.getRestaurantList()).thenAnswer((_) async {
    	await Future.delayed(const Duration(seconds: 2));
	    throw Exception("API Error");
    });

    await tester.pumpWidget(createTestApp());

    provider.fetchRestaurantList();
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
  });

  testWidgets('Displays error message when API request fails', (WidgetTester tester) async {
    when(mockApiServices.getRestaurantList()).thenThrow(Exception("API Error"));

    await tester.pumpWidget(createTestApp());

    provider.fetchRestaurantList();
    await tester.pump();

    expect(find.text("Sorry, There was an error. Please try again later."), findsOneWidget);
  });

  testWidgets('Displays restaurant list when API request is successful', (WidgetTester tester) async {
    when(mockApiServices.getRestaurantList()).thenAnswer((_) async {
      return RestaurantListResponse(
        error: false,
        message: '',
        count: 1,
        restaurants: [
          Restaurant(id: '1', name: 'Test Restaurant', location: 'City', description: 'abc', imageUrl: 'image.jpg', rating: 4.5),
        ],
      );
    });

    await tester.pumpWidget(createTestApp());

    provider.fetchRestaurantList();
    await tester.pumpAndSettle();

    expect(find.text('Test Restaurant'), findsOneWidget);
  });
}
