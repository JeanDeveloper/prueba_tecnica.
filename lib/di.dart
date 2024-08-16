import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/features/products/data/datasources/api_remote_datasource.dart';
import 'package:prueba_tecnica/features/products/data/repositories/product_repository_impl.dart';
import 'package:prueba_tecnica/features/products/domain/repositories/product_repository.dart';
import 'package:prueba_tecnica/features/products/domain/usecases/get_products.dart';
import 'package:prueba_tecnica/features/products/presentation/blocs/product/product_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {

  //BLOC
  di.registerFactory(() => ProductBloc(di()));

  //USE CASES
  di.registerFactory(() => GetProducts(repository: di()));

  //REPOSITORY
  di.registerFactory<ProductRepository>( () => ProductRepositoryImpl(apiRemoteDatasource: di()));

  //DATASOURCE
  di.registerFactory<ApiRemoteDatasource>(() => ApiRemoteDatasourceImpl());
}
