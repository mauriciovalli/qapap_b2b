import 'package:flutter/material.dart';
import 'package:qapaq_b2b/category.dart';

import 'colors.dart';
import 'layout/adaptive.dart';

const textFieldHeight = 60.0;
const appPaddingLargeW = 120.0;
const appPaddingLargeM = 24.0;

const appPaddingSmallW = 20.0;
const appPaddingSmallM = 10.0;

const appPaddingVerticalW = 20.0;
const appPaddingVerticalM = 10.0;

const titleFontSizeW = 20.0;
const titleFontSizeM = 10.0;

const subTitleFontSizeW = 14.0;
const subTitleFontSizeM = 8.0;

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categories = [
    {
      'title': 'Alimentos y Bebidas',
      'img': 'img/cats/food_beverages.jpg',
    },
    {
      'title': 'Agricultura y Animales Vivos',
      'img': 'img/cats/agriculture.jpg',
    },
    {
      'title': 'Ropa y Calzado',
      'img': 'img/cats/clothing.jpg',
    },
    {
      'title': 'Productos para la Casa',
      'img': 'img/house.jpg',
    },
    {
      'title': 'Autos',
      'img': 'img/cars.jpg',
    },
    {
      'title': 'Electrónica',
      'img': 'img/electronics.jpg',
    },
    {
      'title': 'Juguetes y Juegos',
      'img': 'img/cats/toys.jpg',
    },
  ];

  static final searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);

    final appPaddingHorizontalLarge = isDesktop && !isSmallDesktop ? appPaddingLargeW : appPaddingLargeM;
    final appPaddingHorizontalSmall = isDesktop && !isSmallDesktop ? appPaddingSmallW : appPaddingSmallM;
    final appPaddingVertical = isDesktop && !isSmallDesktop ? appPaddingVerticalW : appPaddingVerticalM;


    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          title: HeaderForm(fields: <HeaderFormField>[
            HeaderFormField(
              index: 0,
              iconData: Icons.search,
              title: "Search...",
              textController: searchController,
            ),
          ]),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(appPaddingHorizontalLarge, 0, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("img/logo.jpeg"),
                    radius: 14,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 10, 0, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  Text(
                    "Mensajes",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 10, 0, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.content_paste,
                    color: Colors.white,
                  ),
                  Text(
                    "Ordenes",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 10, 0, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text(
                    "Carrito",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),


          ],
        ),
        //drawer: buildDrawer(),
        body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: builSubHeader()),
            Expanded(
              flex: 20,
              child: buildBody(),
            ),
          ],
        ));
  }

  Widget builSubHeader() {
    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);

    final appPaddingHorizontalLarge = isDesktop && !isSmallDesktop ? appPaddingLargeW : appPaddingLargeM;
    final appPaddingHorizontalSmall = isDesktop && !isSmallDesktop ? appPaddingSmallW : appPaddingSmallM;
    final appPaddingVertical = isDesktop && !isSmallDesktop ? appPaddingVerticalW : appPaddingVerticalM;

    final subTitleFontSize = isDesktop && !isSmallDesktop ? subTitleFontSizeW : subTitleFontSizeM;

    return Container(
      height: 50,
      color: Colors.redAccent,
      child: Row(
        children: [
          for (final category in categories)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: appPaddingHorizontalSmall,
              ),
              child: Row(
                children: [
                  Text(
                    category['title'],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: subTitleFontSize),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildBody() {
    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);

    final count = isDesktop && !isSmallDesktop ? 4 : 2;


    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count, childAspectRatio: 1),
        itemCount: 7,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: buildTitle(categories[i]['title']),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(categories[i]['img']),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            title: categories[i]['title'],
                          )))
            },
          );
        });
  }

  Widget buildTitle(String title) {

    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);

    final titleFontSize = isDesktop && !isSmallDesktop ? titleFontSizeW : titleFontSizeM;


    return Center(
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: titleFontSize),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Colors.white, style: BorderStyle.solid)),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: UserAccountsDrawerHeader(
//              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/mazzad.png"))),
              accountName: Text("Omar Hatem"),
              accountEmail: Text("omarh.ismail1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("img/logo.jpeg"),
                radius: 50,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  buildSeparators("Registeration"),
                  buildTile(
                    "Login",
                    "/login",
                    'img/login.png',
                  ),
                  buildTile(
                    "SignUp",
                    "/signUp",
                    'img/registeration_ico.png',
                  ),
                  Divider(),
                  buildSeparators("Help Center"),
                  buildTile(
                    "Feedback",
                    "/feedback",
                    'img/feedback.png',
                  ),
                  buildTile(
                    "How to order",
                    "/feedback",
                    'img/info.png',
                  ),
                  buildTile(
                    "Shipping",
                    "/feedback",
                    'img/shipping.png',
                  ),
                  buildTile(
                    "Questions and Assistance",
                    "/feedback",
                    'img/assistance.png',
                  ),
                  buildTile(
                    "About payment",
                    "/feedback",
                    'img/visa.png',
                  ),
                  Divider(),
                  buildSeparators("Public Policy"),
                  buildTile(
                    "Privacy Policy",
                    "/feedback",
                    'img/policy.png',
                  ),
                  buildTile(
                    "Terms and Conditions",
                    "/feedback",
                    'img/terms.png',
                  ),
                  buildTile(
                    "Return Policy",
                    "/feedback",
                    'img/refund.png',
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        scale: 1.2,
      ),
      title: Text(name),
      onTap: () {
        if (path != '/login' && path != '/signUp')
          Navigator.pop(context);
        else
          Navigator.pushNamed(context, path);
      },
    );
  }
}

class HeaderForm extends StatelessWidget {
  final List<HeaderFormField> fields;

  const HeaderForm({Key key, this.fields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);

    final appPaddingHorizontalLarge = isDesktop && !isSmallDesktop ? appPaddingLargeW : appPaddingLargeM;
    final appPaddingHorizontalSmall = isDesktop && !isSmallDesktop ? appPaddingSmallW : appPaddingSmallM;
    final appPaddingVertical = isDesktop && !isSmallDesktop ? appPaddingVerticalW : appPaddingVerticalM;

    return Container(
        padding: EdgeInsets.symmetric(
          vertical: appPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,

//          mainAxisAlignment:
//              MainAxisAlignment.spaceEvenly, // use whichever suits your need
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, appPaddingHorizontalLarge, 0),
              child: Image.asset(
                'img/logo_qapaq.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            for (final field in fields)
              Expanded(
                child: _HeaderTextField(field: field),
              ),
//            Container(
//              padding: EdgeInsets.fromLTRB(appPaddingHorizontalLarge, 0, 0, 0),
//              child: Row(
//                children: [
//                  CircleAvatar(
//                    backgroundImage: AssetImage("img/logo.png"),
//                    radius: 15,
//                  ),
//                  Icon(
//                    Icons.arrow_drop_down,
//                    color: Colors.white,
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 0, 0, 0),
//              child: Column(
//                children: [
//                  Icon(
//                    Icons.message,
//                    color: Colors.white,
//                  ),
//                  Text(
//                    "Mensajes",
//                    style: TextStyle(fontSize: 10),
//                  )
//                ],
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 0, 0, 0),
//              child: Column(
//                children: [
//                  Icon(
//                    Icons.content_paste,
//                    color: Colors.white,
//                  ),
//                  Text(
//                    "Ordenes",
//                    style: TextStyle(fontSize: 10),
//                  )
//                ],
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(appPaddingHorizontalSmall, 0, 0, 0),
//              child: Column(
//                children: [
//                  Icon(
//                    Icons.shopping_cart,
//                    color: Colors.white,
//                  ),
//                  Text(
//                    "Carrito",
//                    style: TextStyle(fontSize: 10),
//                  )
//                ],
//              ),
//            ),
          ],
        ));
  }
}

class HeaderFormField {
  final int index;
  final IconData iconData;
  final String title;
  final TextEditingController textController;

  const HeaderFormField({
    this.index,
    this.iconData,
    this.title,
    this.textController,
  });
}

class _HeaderTextField extends StatelessWidget {
  final HeaderFormField field;

  _HeaderTextField({this.field});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: field.textController,
      cursorColor: Theme.of(context).colorScheme.secondary,
      style:
          Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
      onTap: () {},
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        contentPadding: const EdgeInsets.all(16),
        //fillColor: Colors.red,
        filled: true,
        hintText: field.title,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(
          field.iconData,
          size: 24,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
