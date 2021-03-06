import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/presentation/product/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductSHide) {
        return SizedBox(height: 0);
      } else {
        return Expanded(
          flex: 8,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 0)),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is ProductLoaded) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              ProductItem(state.getByPosition(index)),
                          childCount: state.items.length,
                        ),
                      );
                    }
                    if (state is ProductErrorState) {
                      return Text(state.message);
                    } else
                      return Text('Something went wrong!');
                  },
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
