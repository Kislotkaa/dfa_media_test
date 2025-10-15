import 'package:dfa_media_flutter/core/models/app_response.dart';
import 'package:dfa_media_flutter/core/models/product_model.dart';
import 'package:dfa_media_flutter/src/providers/remote_data_provider.dart';

class ProductsRepository {
  final RemoteDataProvider _remoteDataProvider;

  ProductsRepository(this._remoteDataProvider);

  Future<AppResponse<List<ProductModel>, GatewayError>> getProducts() => _remoteDataProvider.getProducts();
}
