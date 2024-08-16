import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/errors/failure.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<Either<Failure, List<Product>>> call() {
    return repository.getProducts();
  }

}
