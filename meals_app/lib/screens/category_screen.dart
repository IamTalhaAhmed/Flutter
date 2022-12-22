import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  //const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deli Meals')),
      body: GridView(
          padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(catData.id, catData.title, catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            //mainAxisExtent: ,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          )),
    );
  }
}
