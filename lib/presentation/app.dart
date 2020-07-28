import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/pages/chat_lobby.dart';
import 'package:qapaq_b2b/pages/home.dart';
import 'package:qapaq_b2b/pages/googleLogin.dart';
import 'package:qapaq_b2b/pages/product_details.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class App extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        Provider<CategoryRepository>(
//            create: (context) => CategoryInMemoryRepository()),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(CategoryLoadEvent()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(ProductHideEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Qapaq - Interconnection made simple',
        theme: CompanyThemeData,
        navigatorObservers: <NavigatorObserver>[observer],
        home: HomePage(),
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument is a RegEx match if it is
  /// included inside of the pattern.
  final Widget Function(BuildContext, String) builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    Path(
      r'^' + ProductDetails.baseRoute + r'/([\w-]+)$',
      (context, match) => ProductDetails(id: match),
    ),
    Path(
      r'^' + ChatHomeScreen.route,
      (context, match) => ChatHomeScreen(),
    ),
    Path(
      r'^' + GoogleLoginPage.route,
          (context, match) => GoogleLoginPage(),
    ),
    Path(
      r'^' + HomePage.route,
      (context, match) => HomePage(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}
