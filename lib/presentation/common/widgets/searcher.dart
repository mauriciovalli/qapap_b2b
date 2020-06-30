import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
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

  void initState() {
    super.initState();
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

    return Expanded(
      child: Container(
        height: 40,
        //padding: EdgeInsets.fromLTRB(0, 50, 50, 50),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
        color: Theme.of(context).primaryColor,
        child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,

//            style: DefaultTextStyle.of(context)
//                .style
//                .copyWith(fontStyle: FontStyle.italic),
//            decoration: InputDecoration(
//                border: OutlineInputBorder(),
//                hintText: 'What are you looking for?'),

            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.start,

            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 2.0),
              ),
              contentPadding: const EdgeInsets.all(16),
              fillColor: Colors.white,
              filled: true,
              hintText: "Buscar ...",
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Theme.of(context).indicatorColor,
              ),
            ),
            controller: _typeAheadController,
          ),
          suggestionsCallback: (pattern) async {
            final patternList = _repository.listByName(pattern);
            var tupleList = List.generate(patternList.length, (index) {
              return {
                'name': patternList[index].name,
                'icon': patternList[index].icon
              };
            });
            return tupleList;
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(IconData(int.parse(suggestion['icon']), fontFamily: 'MaterialIcons')),
              title: Text(suggestion['name']),
            );
          },
          onSuggestionSelected: (suggestion) {
            final categorySelected = _repository.findByName(suggestion['name']);
            BlocProvider.of<CategoryBloc>(context).add(CategoryHide());
            BlocProvider.of<ProductBloc>(context)
                .add(ProductLoad(categorySelected.id));
            this._typeAheadController.text = suggestion['name'];
          },
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
    final suggestionList =
        query.isEmpty ? _repository.list() : _repository.listByName(query);

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          var categorySelected =
              _repository.findByName(suggestionList[index].name);
          BlocProvider.of<CategoryBloc>(context).add(CategoryHide());
          BlocProvider.of<ProductBloc>(context)
              .add(ProductLoad(categorySelected.id));
          close(context, null);
        },
        leading: Icon(IconData(int.parse(suggestionList[index].icon),
            fontFamily: 'MaterialIcons')),
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
      ),
      itemCount: suggestionList.length,
    );
  }
}
