import 'package:flutter/material.dart';

import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key key}) : super(key: key);
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void showMealTypes(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMeals(id, title, color);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMealTypes(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
