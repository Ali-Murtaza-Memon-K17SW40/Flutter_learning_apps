import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  //Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        //Adjust card heights (103)
        elevation: 0.0,
        child: Column(
          //Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                //Adjust the box size (102)
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  //Align labels to the bottom and center (103)
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Change innermost Column (103)
                  children: <Widget>[
                    //Handle overflowing labels (103)
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  //Add a variable for Category (104)
  final Category category;
  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
    //Return an AsymmetricView (104)
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
    //Pass Category variable to AsymmetricView (104)
    // return Scaffold(
    //   //Add app bar (102)
    //   appBar: AppBar(
    //     brightness: Brightness.dark,
    //     //Add buttons and title (102)
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.menu,
    //         semanticLabel: 'menu',
    //       ),
    //       onPressed: () {
    //         print('Menu button');
    //       },
    //     ),
    //     title: Text('SHRINE'),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: Icon(
    //           Icons.search,
    //           semanticLabel: 'search',
    //         ),
    //         onPressed: () {
    //           print('Search button');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.tune,
    //           semanticLabel: 'filter',
    //         ),
    //         onPressed: () {
    //           print('Filter button');
    //         },
    //       ),
    //     ],
    //   ),
    //   // Add a grid view (102)
    //   body: AsymmetricView(
    //       products: ProductsRepository.loadProducts(Category.all)),
    //   //Set resizeToAvoidBottomInset (101)
    //   resizeToAvoidBottomInset: false,
    // );
  }
}
