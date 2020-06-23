import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qapaq_b2b/common/bloc/bloc_provider.dart';
import 'package:qapaq_b2b/pages/home.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/services/product.dart';

import '../dependencies_provider.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
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
        home: BlocProvider(
          bloc: getIt<CategoryBloc>(),
          child: Home(),
        ),
      ),
    );
  }
}
