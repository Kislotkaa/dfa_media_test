import 'dart:developer';

import 'package:dfa_media_flutter/core/models/app_response.dart';
import 'package:dfa_media_flutter/core/models/banner_model.dart';
import 'package:dfa_media_flutter/core/models/product_model.dart';
import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class RemoteDataProvider {
  RemoteDataProvider() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        contentType: 'application/json',
      ),
    )..interceptors.addAll(
        [
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
          ),
          DioCacheInterceptor(
            options: CacheOptions(
              store: MemCacheStore(),
              maxStale: const Duration(days: 1),
              priority: CachePriority.normal,
            ),
          ),
        ],
      );
  }

  Dio? _dio;

  Future<AppResponse<List<BannerModel>, GatewayError>> getBanners() async {
    try {
      final result = await _dio?.get('/banners.json');

      final List<BannerModel> banners =
          List.castFrom(result?.data['banners']).map((e) => BannerModel.fromMap(e)).toList();

      return AppResponse.success(data: banners);
    } on DioException catch (e) {
      return _errorHandler(e);
    }
  }

  Future<AppResponse<List<ProductModel>, GatewayError>> getProducts() async {
    try {
      final result = await _dio?.get('/products.json');

      final List<ProductModel> products =
          List.castFrom(result?.data['products']).map((e) => ProductModel.fromMap(e)).toList();

      return AppResponse.success(data: products);
    } on DioException catch (e) {
      return _errorHandler(e);
    }
  }

  Future<AppResponse<List<StoryModel>, GatewayError>> getStories() async {
    try {
      final result = await _dio?.get('/story.json');

      final List<StoryModel> stories = List.castFrom(result?.data['story']).map((e) => StoryModel.fromMap(e)).toList();

      return AppResponse.success(data: stories);
    } on DioException catch (e) {
      return _errorHandler(e);
    }
  }

  AppResponse<T, GatewayError> _errorHandler<T>(DioException e) {
    log(e.toString());
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppResponse.error(GatewayError.timeOut);

      default:
        return AppResponse.error(GatewayError.somethingWrong);
    }
  }
}
