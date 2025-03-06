import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/data/model/dto/restaurant_list_response.dart';

import 'restaurant_list_provider_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late RestaurantListProvider provider;
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();
    provider = RestaurantListProvider(mockApiServices);
  });

  test('Initial state should be RestaurantListNoneState', () {
    expect(provider.resultState, isA<RestaurantListNoneState>());
  });

  test('Should set state to loading, then loaded when API call succeeds', () async {
    final fakeResponse = RestaurantListResponse(error: false, message: "Success", count:0, restaurants: []);

    when(mockApiServices.getRestaurantList()).thenAnswer((_) async => fakeResponse);

    await provider.fetchRestaurantList();

    expect(provider.resultState, isA<RestaurantListLoadedState>());
  });

  test('Should set state to error when API call fails', () async {
    final fakeResponse = RestaurantListResponse(error: true, message: "API error", count:0, restaurants: []);

    when(mockApiServices.getRestaurantList()).thenAnswer((_) async => fakeResponse);

    await provider.fetchRestaurantList();

    expect(provider.resultState, isA<RestaurantListErrorState>());
  });

  test('Should set state to error when an exception occurs', () async {
    when(mockApiServices.getRestaurantList()).thenThrow(Exception("Network Error"));

    await provider.fetchRestaurantList();

    expect(provider.resultState, isA<RestaurantListErrorState>());
  });
}
