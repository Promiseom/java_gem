import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:java_gem/data/coffee_drink.dart';
import 'package:java_gem/data/coffee_order.dart';
import 'package:java_gem/data/coffee_shop_service.dart';

class OrderScreen extends StatefulWidget{
  OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();

}

class _OrderScreenState extends State<OrderScreen>{
  List<CoffeeOrderItem> orders = [];
  CoffeeDrink? coffeeDrink;
  late int itemCount = 1;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomSheet: Container(
        height: 160,
        padding: EdgeInsets.all(20),
        child: BottomSheet(
          onClosing: (){},
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
                children: [
                  Container(
                    child:  TextButton(
                        onPressed: (){
                          setState((){

                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.white),
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ))
                        ),
                        child: Row(
                            spacing: 20,
                            children: [
                                Icon(
                                  Icons.wallet,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary
                                ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Cash/Wallet',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      Text(
                                          '\$5.53',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).colorScheme.primary
                                          )
                                      )
                                    ]
                                )
                              ),
                              Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.onSurface
                              )
                            ]
                        )
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                            'Order',
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
          'Order',
          style: Theme.of(context).textTheme.headlineSmall
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(bottom:30),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: DefaultTabController(
                              length: 2,
                              child: TabBar(
                                  onTap: (index){
                                    setState((){

                                    });
                                  },
                                  labelColor: Theme.of(context).colorScheme.onPrimary,
                                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                                  dividerHeight: 0,
                                  labelPadding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 0),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  tabs: [
                                    Tab(height: 40, text: 'Deliver'),
                                    Tab(height: 40, text: 'Pickup'),
                                  ]
                              )
                          )
                      )
                  )
                ]
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Deliver Address',
                            style: Theme.of(context).textTheme.headlineSmall
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, bottom: 5),
                            child: Text(
                                'Jl. Kpg Sutoyo',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: 15
                                )
                            )
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                                'Kpg. Sutoyo No.602, Bilzen Tanjungbalai',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                                )
                            )
                        ),
                        Row(
                            spacing: 10,
                            children: [
                              TextButton.icon(
                                  onPressed: (){},
                                  icon: Icon(
                                      Icons.edit_document,
                                      color: Theme.of(context).colorScheme.onSurface
                                  ),
                                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                      side: WidgetStateProperty.all(BorderSide(
                                          color: Theme.of(context).colorScheme.onSurface.withAlpha(180)
                                      )),
                                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ))
                                  ),
                                  label: Text(
                                      'Edit Address',
                                      style: Theme.of(context).textTheme.bodyMedium
                                  )
                              ),
                              TextButton.icon(
                                  onPressed: (){},
                                  icon: Icon(
                                      Icons.note,
                                      color: Theme.of(context).colorScheme.onSurface
                                  ),
                                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                      side: WidgetStateProperty.all(BorderSide(
                                          color: Theme.of(context).colorScheme.onSurface.withAlpha(180)
                                      )),
                                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ))
                                  ),
                                  label: Text(
                                      'Add Note',
                                      style: Theme.of(context).textTheme.bodyMedium
                                  )
                              )
                            ]
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Theme.of(context).colorScheme.onSurface.withAlpha(30)
                            )
                        ),

                        // order items
                        Column(
                            spacing: 10,
                            children: [
                              ...[1, 2].map((item){
                                return Row(
                                    spacing: 15,
                                    children: [
                                      Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(
                                              'assets/images/coffee_1.png',
                                              height: 70
                                          )
                                      ),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Black Coffee',
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontWeight: FontWeight.bold
                                                    )
                                                ),
                                                Text(
                                                    'Foamy',
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontSize: 14,
                                                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                                                    )
                                                ),
                                              ]
                                          )
                                      ),

                                      Row(
                                          spacing: 5,
                                          children: [
                                            IconButton(
                                                onPressed: (){
                                                  if(itemCount >= 2){
                                                    setState((){
                                                      itemCount--;
                                                    });
                                                  }
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor: WidgetStateProperty.all(Colors.white),
                                                    side: WidgetStateProperty.all(BorderSide(
                                                        color: Theme.of(context).colorScheme.onSurfaceVariant
                                                    ))
                                                ),
                                                icon: Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: Theme.of(context).colorScheme.onSurface.withAlpha(190)
                                                )
                                            ),
                                            SizedBox(
                                              width: 30,
                                              child: Text(
                                                  itemCount.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                    fontSize: 15
                                                  )
                                              )
                                            ),
                                            IconButton(
                                                onPressed: (){
                                                  setState((){
                                                    itemCount++;
                                                  });
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor: WidgetStateProperty.all(Colors.white),
                                                    side: WidgetStateProperty.all(BorderSide(
                                                        color: Theme.of(context).colorScheme.onSurfaceVariant
                                                    )),
                                                  padding: WidgetStateProperty.all(EdgeInsets.zero)
                                                ),
                                                icon: Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: Theme.of(context).colorScheme.onSurface.withAlpha(190)
                                                )
                                            )
                                          ]
                                      )
                                    ]
                                );
                              })
                            ]
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Theme.of(context).colorScheme.onSurface.withAlpha(30)
                            )
                        ),

                        Container(
                            child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child:  TextButton(
                                        onPressed: (){
                                          setState((){

                                          });
                                        },
                                        style: ButtonStyle(
                                            backgroundColor: WidgetStateProperty.all(Colors.white),
                                            side: WidgetStateProperty.all(BorderSide(
                                              color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
                                            )),
                                            padding: WidgetStateProperty.all(EdgeInsets.all(20)),
                                            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            ))
                                        ),
                                        child: Row(
                                            spacing: 20,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/discount.svg',
                                                  color: Theme.of(context).colorScheme.primary
                                              ),
                                              Expanded(
                                                  child: Text(
                                                      '1 Discount is applied',
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  )
                                              ),
                                              Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Theme.of(context).colorScheme.onSurface
                                              )
                                            ]
                                        )
                                    ),
                                  ),
                                  Column(
                                    spacing: 10,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Payment Summary',
                                          style: Theme.of(context).textTheme.headlineSmall
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  'Drink Name (x1)',
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    fontSize: 14
                                                  )
                                              )
                                          ),
                                          Text(
                                              '\$4.43',
                                              style: Theme.of(context).textTheme.headlineSmall
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  'Drink Name2 (x1)',
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontSize: 14
                                                  )
                                              )
                                          ),
                                          Text(
                                              '\$2.43',
                                              style: Theme.of(context).textTheme.headlineSmall
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  'Delivery Fee',
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontSize: 14
                                                  )
                                              )
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text(
                                                '\$2.00',
                                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                    decoration: TextDecoration.lineThrough
                                                )
                                            ),
                                          ),
                                          Text(
                                              '\$1.00',
                                              style: Theme.of(context).textTheme.headlineSmall
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]
                            )
                        ),

                        SizedBox(height: 170)
                      ]
                  )
              )
            )
          ],
        )
      )
    );
  }
}

