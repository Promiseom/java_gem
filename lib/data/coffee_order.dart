import 'package:java_gem/data/coffee_drink.dart';

class CoffeeOrderItem {
  int count;
  CoffeeDrink drink;

  CoffeeOrderItem(this.drink, {this.count = 0});

  void updateCount(int newCount){
    count = newCount;
  }
}