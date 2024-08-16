import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/errors/failure.dart';
import 'package:prueba_tecnica/features/products/data/datasources/api_remote_datasource.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/domain/repositories/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository{

  final ApiRemoteDatasource apiRemoteDatasource;

  ProductRepositoryImpl({required this.apiRemoteDatasource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final List<Product> resp = await apiRemoteDatasource.getProducts();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }

  }


}