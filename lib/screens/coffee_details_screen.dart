import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:java_gem/data/coffee_drink.dart';
import 'package:java_gem/data/coffee_shop_service.dart';

class CoffeeDetailsScreen extends StatefulWidget{
  String drinkName;

  CoffeeDetailsScreen({super.key, required this.drinkName});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();

}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen>{

  late CoffeeShopService _coffeeService;
  CoffeeDrink? coffeeDrink;
  String? selectedSize = 'm';
  List<Map<String, String>> sizes = [
    {
      'label': 'S',
      'value': 's'
    },
    {
      'label': 'M',
      'value': 'm'
    },
    {
      'label': 'L',
      'value': 'l'
    }
  ];

  @override
  void initState(){
    super.initState();
    _coffeeService = CoffeeShopService();
    coffeeDrink = _coffeeService.getCoffeeDrink(widget.drinkName);
  }

  @override
  void dispose(){

    super.dispose();
  }

  ButtonStyle? unSelectedSizeTheme(BuildContext context){
    return Theme.of(context).textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        side: WidgetStateProperty.all(BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(90)
        )),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
        )
    );
  }

  ButtonStyle? selectedSizeTheme(BuildContext context){
    return Theme.of(context).textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary.withAlpha(30)),
        side: WidgetStateProperty.all(BorderSide(
            color: Theme.of(context).colorScheme.primary
        )),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
        )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomSheet: Container(
        height: 100,
        padding: EdgeInsets.all(20),
        child: BottomSheet(
          onClosing: (){},
          builder: (BuildContext context) {
            return Row(
                spacing: 50,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            'Price',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1,
                              color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                            )
                        ),
                        SizedBox(height: 10),
                        Text(
                            '\$ 4.53',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 22,
                              height: 1,
                              color: Theme.of(context).colorScheme.primary
                            )
                        ),
                      ]
                  ),
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: TextButton(
                          onPressed: (){
                            GoRouter.of(context).push('/order');
                          },
                          child: Text(
                              'Buy Now',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.bold
                              )
                          ),
                        style: Theme.of(context).textButtonTheme.style?.copyWith(
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            )
                        ),
                      )
                    )
                  )
                ]
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new
          )
        ),
        centerTitle: true,
        title: Text(
            'Details',
          style: Theme.of(context).textTheme.headlineSmall
        ),
        actions:[
          IconButton(
              onPressed: (){

              },
              icon: SvgPicture.asset(
                  'assets/icons/heart.svg'
              )
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: coffeeDrink != null? Column(
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
                                    coffeeDrink!.image,
                                    height:200,
                                    fit: BoxFit.fitWidth
                                )
                            )
                        )
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 0),
                    child: Text(
                        coffeeDrink!.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            height: 1
                        )
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                          child: Container(
                            child: Text(
                                coffeeDrink!.shortDescription,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                                )
                            ),
                          )
                      ),
                      TextButton(
                        onPressed: (){},
                        style: Theme.of(context).textButtonTheme.style?.copyWith(
                            padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface.withAlpha(5))
                        ),
                        child: Image.asset(
                            'assets/icons/bike.png',
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        style: Theme.of(context).textButtonTheme.style?.copyWith(
                            padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface.withAlpha(5))
                        ),
                        child: Image.asset(
                            'assets/icons/beans.png',
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        style: Theme.of(context).textButtonTheme.style?.copyWith(
                            padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface.withAlpha(5))
                        ),
                        child: Image.asset(
                            'assets/icons/milk.png',
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover
                        ),
                      )
                    ],
                  ),
                  Row(
                      children: [
                        Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFBBE21)
                        ),
                        SizedBox(width: 2),
                        Text(
                            '4.5',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 18,
                                height: 1
                            )
                        ),
                        SizedBox(width: 5),
                        Text(
                            '(250)',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                            )
                        ),
                      ]
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          color: Theme.of(context).colorScheme.onSurface.withAlpha(30)
                      )
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 18,
                            height: 1
                        )
                    ),
                  ),
                  Row(
                      children: [
                        Expanded(
                            child: Text(
                                coffeeDrink!.description,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                                )
                            )
                        )
                      ]
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                        'Size',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 18,
                            height: 1
                        )
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      ...sizes.map((size){
                        return Expanded(
                            child: TextButton(
                                onPressed: (){
                                  setState((){
                                    selectedSize = size['value'];
                                  });
                                },
                                style: selectedSize == size['value']? selectedSizeTheme(context) : unSelectedSizeTheme(context),
                                child: Text(
                                    size['label']?? 'N/A',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 18,
                                        height: 1,
                                        color: selectedSize == size['value']? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface
                                    )
                                )
                            )
                        );
                      })
                    ]
                  ),
                  SizedBox(height: 100),
                ]
            ) : Row(
              children: [
                Expanded(
                  child: Text(
                      '${widget.drinkName} not found',
                    textAlign: TextAlign.center,
                  )
                )
              ]
            )
        )
      )
    );
  }
}

