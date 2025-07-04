// Mocks generated by Mockito 5.4.5 from annotations
// in submission1_dennistandelon/test/unit_test/restaurant_list_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:submission1_dennistandelon/data/api/api_services.dart' as _i4;
import 'package:submission1_dennistandelon/data/model/dto/restaurant_detail_response.dart'
    as _i3;
import 'package:submission1_dennistandelon/data/model/dto/restaurant_list_response.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRestaurantListResponse_0 extends _i1.SmartFake
    implements _i2.RestaurantListResponse {
  _FakeRestaurantListResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeRestaurantDetailResponse_1 extends _i1.SmartFake
    implements _i3.RestaurantDetailResponse {
  _FakeRestaurantDetailResponse_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiServices extends _i1.Mock implements _i4.ApiServices {
  MockApiServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.RestaurantListResponse> getRestaurantList() =>
      (super.noSuchMethod(
            Invocation.method(#getRestaurantList, []),
            returnValue: _i5.Future<_i2.RestaurantListResponse>.value(
              _FakeRestaurantListResponse_0(
                this,
                Invocation.method(#getRestaurantList, []),
              ),
            ),
          )
          as _i5.Future<_i2.RestaurantListResponse>);

  @override
  _i5.Future<_i3.RestaurantDetailResponse> getRestaurantDetail(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#getRestaurantDetail, [id]),
            returnValue: _i5.Future<_i3.RestaurantDetailResponse>.value(
              _FakeRestaurantDetailResponse_1(
                this,
                Invocation.method(#getRestaurantDetail, [id]),
              ),
            ),
          )
          as _i5.Future<_i3.RestaurantDetailResponse>);

  @override
  _i5.Future<_i2.RestaurantListResponse> getSearchResults(String? searchText) =>
      (super.noSuchMethod(
            Invocation.method(#getSearchResults, [searchText]),
            returnValue: _i5.Future<_i2.RestaurantListResponse>.value(
              _FakeRestaurantListResponse_0(
                this,
                Invocation.method(#getSearchResults, [searchText]),
              ),
            ),
          )
          as _i5.Future<_i2.RestaurantListResponse>);
}
