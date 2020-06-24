import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qapaq_b2b/models/category_repository.dart';
import 'package:qapaq_b2b/pages/home.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/services/category.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        Provider<CategoryRepository>(
//            create: (context) => CategoryInMemoryRepository()),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(CategoryLoad()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(ProductHide()),
        ),
      ],
      child: MaterialApp(
        title: 'Qapaq',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
