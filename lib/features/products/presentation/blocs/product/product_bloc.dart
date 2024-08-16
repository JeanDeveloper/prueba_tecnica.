import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:prueba_tecnica/core/errors/failure.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final GetProducts getProducts;
  final List<Product> listProducts = [];

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(ProductLoading());
        final productList = await getProducts();
        emit(_failureOrSuccess( productList ));
      }
    });
  }

  ProductState _failureOrSuccess(Either<Failure, List<Product>> failureOrSuccess) {
    return failureOrSuccess.fold( ( failure ) => 
      ProductError(_mapFailureToMessage( failure )), 
      (list) {
        listProducts.clear();
        listProducts.addAll(list);
        return ProductLoaded(list);
      }
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      default:
        return "Error inesperado";
    }
  }

}
