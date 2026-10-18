import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CoffeeItem extends StatelessWidget{
  late String name;
  late String displayName;
  late String desc;
  late double cost;
  late String image;

  CoffeeItem({super.key, required this.name, required this.desc, required this.cost, required this.image}){
    // purge the name
    final drinkName = name.split(' ');
    drinkName.removeLast();
    displayName = drinkName.join(' ');
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/coffee/$name');
      },
      child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withAlpha(15),
              //       blurRadius: 5,
              //       spreadRadius: 2
              //   )
              // ]
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                              image,
                              fit: BoxFit.fitWidth
                          ),
                        )
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 16,
                          height: 1
                      )
                  ),
                ),
                Container(
                  child: Text(
                      desc,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withAlpha(200)
                      )
                  ),
                ),
                Row(
                    children: [
                      Expanded(
                        child: Text(
                            '\$$cost',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 19
                            )
                        ),
                      ),
                      SizedBox(
                          width: 45,
                          child: TextButton.icon(
                              onPressed: (){
                                debugPrint('add coffee to cart');
                              },
                              label: Icon(
                                  Icons.add
                              )
                          )
                      )
                    ]
                )
              ]
          )
      )
    );
  }
}