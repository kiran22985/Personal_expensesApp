import 'package:flutter/material.dart';
import 'package:udemycourse/section4/personalExpensesApp/mainApp.dart';
import 'package:udemycourse/section7/screens/bottomNavigation.dart';
import 'package:udemycourse/section7/screens/categories_screen.dart';
import 'package:udemycourse/section7/screens/category_meals_screen.dart';
import 'package:udemycourse/section7/screens/meal_detail.dart';
import 'package:udemycourse/section7/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "QuickSand",
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge:const TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        )
      ),
      // home: CategoryScreen(),
      initialRoute: "/",
      routes: {
        "/":(context) => const BottomNavigationBarPage(),
        CategoryMealDetail.routeName:(context) => const  CategoryMealDetail(),
        MealDetail.routeName:(context) => const MealDetail(),
      },
    );
  }
}

