import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeItem extends StatelessWidget{
  late String name;
  late String desc;
  late double cost;
  late String image;

  CoffeeItem({super.key, required this.name, required this.desc, required this.cost, required this.image}){
    // purge the name
    final coffeeName = name.split(' ');
    coffeeName.removeLast();
    name = coffeeName.join(' ');
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 5,
              spreadRadius: 2
            )
          ]
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
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                      onPressed: (){},
                      label: Icon(
                          Icons.add
                      )
                  )
                )
              ]
            )
          ]
        )
    );
  }
}