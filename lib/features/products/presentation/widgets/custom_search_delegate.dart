import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/features/products/presentation/blocs/product/product_bloc.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/product_list.dart';



class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
          size: 28,
        ),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    final listProduct = productBloc.listProducts;
    final listProductFiltered = listProduct.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ProductList( productList: listProductFiltered );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    final listProduct = productBloc.listProducts;
    final listProductFiltered = listProduct.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ProductList( productList: listProductFiltered );
  }

}
