import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/services/category_repository.dart';

class WebSearcher extends StatefulWidget {
  WebSearcher({Key key}) : super(key: key);

  @override
  _WebSearcherState createState() => _WebSearcherState();
}

class _WebSearcherState extends State<WebSearcher> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<String> filterTypes = <String>['Productos', 'Empresas'];

  String selectedFilterType;

  void initState() {
    super.initState();
    selectedFilterType = filterTypes[0];
    _typeAheadController.addListener(() {
      final text = _typeAheadController.text;
      _typeAheadController.value = _typeAheadController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final CategoryRepository _repository = getIt<CategoryRepository>();
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final double margin = themeConfig.isDesktop
        ? (themeConfig.isSmallDesktop
            ? 120
            : (MediaQuery.of(context).size.width - 1000) / 2)
        : 20;

    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(margin, 10, margin, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 45,
            padding: EdgeInsets.all(1),
            color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                    color: Colors.grey[300],
                    child: DropdownButton<String>(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.grey[800], fontSize: 12),
                      value: selectedFilterType,
                      onChanged: (String value) {
                        setState(() {
                          selectedFilterType = value;
                        });
                      },
                      dropdownColor: Colors.grey[300],
                      focusColor: Colors.grey[400],
                      underline: Container(),
                      items: filterTypes.map((String filter) {
                        return DropdownMenuItem<String>(
                          value: filter,
                          child: Text(
                            filter,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.grey[800], fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      color: Colors.white,
                      child: TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: false,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 11, 0, 0),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Buscar ...",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.grey, fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            suffixIcon: Container(
                              color: Theme.of(context).accentColor,
                              child: Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                          controller: _typeAheadController,
                        ),
                        suggestionsCallback: (pattern) async {
                          final patternList =
                              await _repository.listByName(pattern);
                          var tupleList =
                              List.generate(patternList.length, (index) {
                            return {
                              'name': patternList[index].name,
                              'icon': patternList[index].icon,
                            };
                          });
                          return tupleList;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            leading: Icon(suggestion['icon']),
                            title: Text(suggestion['name']),
                          );
                        },
                        onSuggestionSelected: (suggestion) async {
                          final categorySelected =
                              await _repository.findByName(suggestion['name']);
                          BlocProvider.of<CategoryBloc>(context)
                              .add(CategoryHideEvent());
                          BlocProvider.of<ProductBloc>(context)
                              .add(ProductLoadEvent(categorySelected.id));
                          this._typeAheadController.text = suggestion['name'];
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileDataSearcher extends SearchDelegate<String> {
  final CategoryRepository _repository = getIt<CategoryRepository>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future:
          query.isEmpty ? _repository.list() : _repository.listByName(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final entities = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) =>
                buildItem(context, entities, index),
            itemCount: entities.length,
          );
        } else {
          return Column();
        }
      },
    );
  }

  Widget buildItem(
      BuildContext context, List<CategoryModel> suggestionList, int index) {
    return ListTile(
      onTap: () async {
        final categorySelected =
            await _repository.findByName(suggestionList[index].name);
        BlocProvider.of<CategoryBloc>(context).add(CategoryHideEvent());
        BlocProvider.of<ProductBloc>(context)
            .add(ProductLoadEvent(categorySelected.id));
        close(context, null);
      },
      leading: Icon(suggestionList[index].icon),
      title: RichText(
          text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
            TextSpan(
              text: suggestionList[index].name.substring(query.length),
              style: TextStyle(color: Colors.grey),
            ),
          ])),
    );
  }
}
