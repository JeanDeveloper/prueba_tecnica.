
import 'package:dio/dio.dart';
import 'package:prueba_tecnica/core/utils/constants.dart';
import 'package:prueba_tecnica/features/products/data/models/product_model.dart';

abstract class ApiRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class ApiRemoteDatasourceImpl implements ApiRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<List<ProductModel>> getProducts() async {
    final Response resp = await dio.get('${Constants.pathApi}products');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = productModelFromJson(json);
    return resp1;
  }
}
