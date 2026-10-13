import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:java_gem/widgets/CoffeeItem.dart';
import 'package:java_gem/widgets/PromoBanner.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  List<String> coffeeDrinks = [
    'All Coffee',
    'Macchaiato',
    'Latte',
    'Americano',
    'Espresso',
    'Cappuccino',
    'Flat White',
    'Mocha'
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              // the white and black surface
              Column(
                  children: [
                    SizedBox(
                      height: 290,
                        child: Container(
                          color: Theme.of(context).colorScheme.onSurface,
                        )
                    ),
                    Expanded(
                        child: Container(
                          color: Theme.of(context).colorScheme.surface,
                        )
                    )
                  ]
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Location',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(150)
                              )
                          ),
                          SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              dropdownColor: Theme.of(context).colorScheme.onSurface,
                              icon: Icon(
                                Icons.keyboard_arrow_down
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 3),
                                isCollapsed: true,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide.none
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant
                              ),
                              hint: Text(
                                'Bilzen, Tanjungbalai',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  )
                              ),
                                items: [
                                  DropdownMenuItem(
                                      value: 'Cairo',
                                      child: Text(
                                          'Cairo, Egypt'
                                      ),
                                  ),
                                  DropdownMenuItem(
                                      value: 'Lagos',
                                      child: Text(
                                          'Lagos, Nigeria'
                                      )
                                  )
                                ],
                                onChanged: (newSelection){
                                }
                            )
                          ),

                          Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 30),
                              decoration: BoxDecoration(
                                  // border: BoxBorder.all(
                                  //     color: Colors.white
                                  // )
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                        padding: EdgeInsets.all(15),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(20),
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/icons/search.svg',
                                                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                                              ),
                                                              SizedBox(width: 10),
                                                              Expanded(
                                                                  child: TextFormField(
                                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                                                        height: 1
                                                                      ),
                                                                      decoration: InputDecoration(
                                                                          contentPadding: EdgeInsets.zero,
                                                                          isCollapsed: true,
                                                                          isDense: false,
                                                                          hintText: 'Search Coffee',
                                                                          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                                            fontSize: 13,
                                                                            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(150),
                                                                          ),
                                                                          border: InputBorder.none
                                                                      )
                                                                  )
                                                              )
                                                            ]
                                                        )
                                                    )
                                                  )
                                                ]
                                              )
                                          ),
                                          SizedBox(width: 15),
                                          Column(
                                            children: [
                                              Expanded(
                                                child: TextButton.icon(
                                                    onPressed: (){},
                                                    label: SvgPicture.asset(
                                                        'assets/icons/filter.svg',
                                                        color: Colors.white
                                                    )
                                                )
                                              )
                                            ]
                                          )
                                        ]
                                    )
                                  )
                                ]
                              )
                          ),

                          PromoBanner(),

                          Container(
                            margin: EdgeInsets.only(top: 30, bottom:30),
                            child: DefaultTabController(
                                length: coffeeDrinks.length,
                                child: TabBar(
                                  tabAlignment: TabAlignment.center,
                                    isScrollable: true,
                                    labelColor: Theme.of(context).colorScheme.onPrimary,
                                    unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                                    dividerHeight: 0,
                                    labelPadding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 0),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    tabs: [
                                      ...coffeeDrinks.map((drink){
                                        return Tab(height: 40, text: drink);
                                      })
                                    ]
                                )
                            )
                          ),

                          CoffeeItem()
                        ]
                    )
                  )
              )
            ]
        )
      )
    );
  }
}