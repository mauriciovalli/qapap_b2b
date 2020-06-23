import 'package:flutter/material.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_state.dart';
import 'package:qapaq_b2b/presentation/product/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final ProductBloc _bloc;
  final int categoryId;

  ProductList(this.categoryId) : _bloc = getIt<ProductBloc>() {
    _bloc.searchByCategory('Elements', categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductState>(
      initialData: _bloc.state,
      stream: _bloc.observableState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is LoadingProductState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorProductState) {
          return Center(child: Text(state.message));
        } else {
          return _renderProductList(context, state);
        }
      },
    );
  }

  Widget _renderProductList(
      BuildContext context, LoadedProductState state) {
    return GridView.builder(
      itemCount: state.items.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final ProductItemState product = state.items[index];

        return ProductItem(product);
      },
    );
  }
}
