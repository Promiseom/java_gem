import 'package:flutter_test/flutter_test.dart';
import 'package:java_gem/data/coffee_drink.dart';

void main(){
  final drinkData = {
    'name': 'Caffè Mocha Macchiato',
    'shortDesc': 'Deep Foam',
    'desc': 'Freshly steamed milk with mocha flavor marked with rich espresso shots.',
    'cost': 4.55,
    'image': 'assets/images/coffee_1.png',
  };
  group('CoffeeDrink Data initialization Tests', (){
    test('CoffeeDrink should initialize data form a map without an error', (){
      expect(()=>CoffeeDrink.fromMap(drinkData), returnsNormally);
      final coffeeDrink = CoffeeDrink.fromMap(drinkData);

      expect(coffeeDrink.name, 'Caffè Mocha Macchiato');
      expect(coffeeDrink.shortDescription, 'Deep Foam');
      expect(coffeeDrink.description, 'Freshly steamed milk with mocha flavor marked with rich espresso shots.');
      expect(coffeeDrink.cost, 4.55);
      expect(coffeeDrink.image, 'assets/images/coffee_1.png');
    });
  });

}