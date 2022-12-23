import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';

import 'screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoryScreen(),
      routes: {
        '/': (context) => CategoryScreen(),
        CategoryMeals.routeName: (context) => CategoryMeals(),
        MealDetails.routeName: (context) => MealDetails()
      },
    );
  }
}
