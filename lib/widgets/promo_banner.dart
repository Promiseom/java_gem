import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget{
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/cozy_valentine_coffee.png'),
              fit: BoxFit.contain,
              alignment: Alignment(3.7, 0),
            )
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                      'Promo',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onError,
                          height: 1,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Transform.translate(
                      offset: Offset(0, -12),
                      child: Text(
                          'Buy one get',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onError,
                              height: 1,
                              fontWeight: FontWeight.bold
                          )
                      )
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Transform.translate(
                      offset: Offset(0, -12),
                      child: Text(
                          'one FREE',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onError,
                              height: 1,
                              fontWeight: FontWeight.bold
                          )
                      )
                  )
              )
            ]
        )
    );
  }
}