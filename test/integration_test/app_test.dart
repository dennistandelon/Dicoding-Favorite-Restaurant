import 'package:flutter_test/flutter_test.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/static/restaurant_list_result_state.dart';

void main() {
  test('Fetch restaurants with real API', () async {
    final apiService = ApiServices();
    final provider = RestaurantListProvider(apiService);

    await provider.fetchRestaurantList();

    expect(provider.resultState, isA<RestaurantListLoadedState>());
  });
}