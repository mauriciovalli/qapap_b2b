import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme_config.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/pages/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/category/category_state.dart';

class CategorySimpleList extends StatelessWidget {
  final CategoryBloc _bloc;

  CategorySimpleList() : _bloc = getIt<CategoryBloc>() {
    _bloc.search('Elements');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return StreamBuilder<CategoryState>(
      initialData: _bloc.state,
      stream: _bloc.observableState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is LoadingCategoryState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorCategoryState) {
          return Center(child: Text(state.message));
        } else {
          return _renderCartegoryList(context, state, themeConfig);
        }
      },
    );
  }

  Widget _renderCartegoryList(
      BuildContext context, LoadedCategoryState state, ThemeConfig themeConfig) {
    double heightContaner = 30.0;

    return Container(
      height: heightContaner,
      color: Colors.redAccent,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          // La línea a continuación hace el truco.
          scrollDirection: Axis.horizontal,
          itemCount: state.items.length,
          itemBuilder: (context, i) {
            return InkWell(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: themeConfig.appPaddingHorizontalSmall,
                ),
                child: Text(
                  state.items[i].name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white),
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      title: state.items[i].name,
                      id: state.items[i].id,
                    ),
                  ),
                )
              },
            );
          }),
    );
  }
}
