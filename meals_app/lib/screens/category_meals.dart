import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  // final String id;
  // final String title;
  // final Color color;

  // CategoryMeals(this.id, this.title, this.color);
  static const routeName = '/meal-types';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    // final imageUrl = routeArgs['imageUrl'];
    // final duration = routeArgs['duration'];
    // final complexity = routeArgs['complexity'];
    // final affordability = routeArgs['affordability'];

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
