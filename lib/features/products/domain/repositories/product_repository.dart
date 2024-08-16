
import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/errors/failure.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
