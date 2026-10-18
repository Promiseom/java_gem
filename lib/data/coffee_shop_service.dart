import 'package:flutter/material.dart';
import 'package:java_gem/data/coffee_drink.dart';

class CoffeeShopService {
  late List<String> coffeeDrinks;
  final Map<String, List<dynamic>> _dbDrinks = {
    'Macchiato': [
      {
        'name': 'Caffè Mocha Macchiato',
        'shortDesc': 'Deep Foam',
        'desc': 'Freshly steamed milk with mocha flavor marked with rich espresso shots.',
        'cost': 4.55,
        'image': 'assets/images/coffee_1.png',
      },
      {
        'name': 'Caramel Macchiato',
        'shortDesc': 'Caramel Drizzle',
        'desc': 'Freshly steamed milk with vanilla-flavored syrup marked with espresso and caramel drizzle.',
        'cost': 4.75,
        'image': 'assets/images/coffee_2.png',
      },
    ],
    'Latte': [
      {
        'name': 'Caffè Latte',
        'shortDesc': 'Steamed Milk',
        'desc': 'Rich, full-bodied espresso in steamed milk with a light layer of foam.',
        'cost': 4.25,
        'image': 'assets/images/coffee_3.png',
      },
      {
        'name': 'Vanilla Oat Latte',
        'shortDesc': 'Smooth & Sweet',
        'desc': 'Smooth espresso paired with creamy oat milk and sweet vanilla syrup.',
        'cost': 5.15,
        'image': 'assets/images/coffee_4.png',
      },
    ],
    'Americano': [
      {
        'name': 'Caffè Americano',
        'shortDesc': 'Hot Water & Espresso',
        'desc': 'Espresso shots topped with hot water to produce a light layer of crema.',
        'cost': 3.45,
        'image': 'assets/images/coffee_5.png',
      },
      {
        'name': 'Iced Americano',
        'shortDesc': 'Crisp & Bold',
        'desc':
            'Espresso shots poured over ice and cold water for a crisp taste.',
        'cost': 3.75,
        'image': 'assets/images/coffee_1.png',
      },
    ],
    'Espresso': [
      {
        'name': 'Single Espresso',
        'shortDesc': 'Rich Crema',
        'desc': 'A concentrated shot of pure, rich coffee brewed under high pressure.',
        'cost': 2.95,
        'image': 'assets/images/coffee_2.png',
      },
      {
        'name': 'Double Espresso',
        'shortDesc': 'Double Shot',
        'desc': 'Two shots of rich espresso for double the bold coffee flavor.',
        'cost': 3.65,
        'image': 'assets/images/coffee_3.png',
      },
    ],
    'Cappuccino': [
      {
        'name': 'Classic Cappuccino',
        'shortDesc': 'Thick Foam',
        'desc': 'Dark, rich espresso lying in wait under a smoothed and stretched layer of thick foam.',
        'cost': 4.45,
        'image': 'assets/images/coffee_4.png',
      },
      {
        'name': 'Dry Cappuccino',
        'shortDesc': 'Airy Foam',
        'desc': 'Espresso topped almost entirely with airy, thick milk foam.',
        'cost': 4.45,
        'image': 'assets/images/coffee_5.png',
      },
    ],
    'Flat White': [
      {
        'name': 'Flat White',
        'shortDesc': 'Silky Microfoam',
        'desc': 'Bold ristretto shots of espresso infused with silky steamed microfoam.',
        'cost': 4.65,
        'image': 'assets/images/coffee_1.png',
      },
      {
        'name': 'Honey Almond Flat White',
        'shortDesc': 'Sweet & Nutty',
        'desc': 'Ristretto shots blended with almond milk and a touch of natural honey.',
        'cost': 5.25,
        'image': 'assets/images/coffee_2.png',
      },
    ],
    'Mocha': [
      {
        'name': 'Caffè Mocha',
        'shortDesc': 'Bittersweet Chocolate',
        'desc': 'Espresso combined with bittersweet chocolate sauce and steamed milk.',
        'cost': 4.85,
        'image': 'assets/images/coffee_3.png',
      },
      {
        'name': 'White Chocolate Mocha',
        'shortDesc': 'Creamy Cocoa',
        'desc': 'Espresso with white chocolate sauce and milk, finished with whipped cream.',
        'cost': 5.15,
        'image': 'assets/images/coffee_4.png',
      },
    ],
  };
  late Map<String, List<CoffeeDrink>> _drinks;

  CoffeeShopService() {
    _drinks = {};
    coffeeDrinks = [
      'All Coffee',
      'Macchiato',
      'Latte',
      'Americano',
      'Espresso',
      'Cappuccino',
      'Flat White',
      'Mocha',
    ];

    for(String drinkType in _dbDrinks.keys){
      _drinks[drinkType] = _dbDrinks[drinkType]!.map((drink){
        return CoffeeDrink.fromMap(drink);
      }).toList();
    }
  }

  List<String> getCoffeeDrinkCategories(){
    return coffeeDrinks;
  }

  List<CoffeeDrink> getFilteredDrinks({String filter = 'All Coffee'}) {
    if (filter.toLowerCase() == 'all coffee') {
      return _drinks.values.expand((list) => list).toList();
    }
    return _drinks.containsKey(filter) ? _drinks[filter]! : [];
  }

  CoffeeDrink? getCoffeeDrink(String name){
      final allDrinks = getFilteredDrinks();
      debugPrint('searching $name in ${allDrinks.length} items');
      final found = allDrinks.where((drink)=>drink.name == name);
      return found.firstOrNull;
  }
}
