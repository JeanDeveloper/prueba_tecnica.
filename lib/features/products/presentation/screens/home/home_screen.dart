import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/presentation/blocs/product/product_bloc.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/app_search_bar.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/custom_search_delegate.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {

            if( state is ProductInitial || state is ProductLoading ){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ProductLoaded){
              final products = state.products;
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * .03),
                    color: GreenAppleColors.topBarBackgroundColor,
                    width: double.infinity,
                    height: size.height * .15,
                    child: FadeInRight(
                      child: AppBarSearch(
                        ontap: () {
                          showSearch(context: context, delegate: CustomSearchDelegate());
                        },
                      ),
                    ),
                  ),
                  ProductList(productList: products)
                ],
              );
            }

            return Container();
          },
        ),
      )
    
    );

  }
}
