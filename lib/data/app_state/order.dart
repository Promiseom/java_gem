
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_gem/data/coffee_order.dart';

final orderProvider = NotifierProvider<Order, List<CoffeeOrderItem>>(Order.new);

class Order extends Notifier<List<CoffeeOrderItem>>{
  @override
  List<CoffeeOrderItem> build(){
    return [];
  }

  void addItem(CoffeeOrderItem item){
    int index = state.indexWhere((orderItem)=> orderItem.drink.name == item.drink.name);
    if(index == -1){
      return state.add(item);
    }
    state[index].count++;
  }

  void removeItem(String drinkName){
    int index = state.indexWhere((orderItem)=> orderItem.drink.name == drinkName);
    if(state[index].count > 1){
      state[index].count--;
      return;
    }
    state.removeAt(index);
  }
}