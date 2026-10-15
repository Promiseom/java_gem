import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:java_gem/widgets/CoffeeItems.dart';
import 'package:java_gem/widgets/PromoBanner.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  List<String> coffeeDrinks = [
    'All Coffee',
    'Macchiato',
    'Latte',
    'Americano',
    'Espresso',
    'Cappuccino',
    'Flat White',
    'Mocha'
  ];

  Map<String, List<Map<String, dynamic>>> drinksList = {
    'Macchiato': [
      {
        'name': 'Caffè Mocha Macchiato',
        'shortDesc': 'Deep Foam',
        'desc': 'Freshly steamed milk with mocha flavor marked with rich espresso shots.',
        'cost': 4.55,
        'image': 'assets/images/coffee_1.png'
      },
      {
        'name': 'Caramel Macchiato',
        'shortDesc': 'Caramel Drizzle',
        'desc': 'Freshly steamed milk with vanilla-flavored syrup marked with espresso and caramel drizzle.',
        'cost': 4.75,
        'image': 'assets/images/coffee_2.png'
      },
    ],
    'Latte': [
      {
        'name': 'Caffè Latte',
        'shortDesc': 'Steamed Milk',
        'desc': 'Rich, full-bodied espresso in steamed milk with a light layer of foam.',
        'cost': 4.25,
        'image': 'assets/images/coffee_3.png'
      },
      {
        'name': 'Vanilla Oat Latte',
        'shortDesc': 'Smooth & Sweet',
        'desc': 'Smooth espresso paired with creamy oat milk and sweet vanilla syrup.',
        'cost': 5.15,
        'image': 'assets/images/coffee_4.png'
      },
    ],
    'Americano': [
      {
        'name': 'Caffè Americano',
        'shortDesc': 'Hot Water & Espresso',
        'desc': 'Espresso shots topped with hot water to produce a light layer of crema.',
        'cost': 3.45,
        'image': 'assets/images/coffee_5.png'
      },
      {
        'name': 'Iced Americano',
        'shortDesc': 'Crisp & Bold',
        'desc': 'Espresso shots poured over ice and cold water for a crisp taste.',
        'cost': 3.75,
        'image': 'assets/images/coffee_1.png'
      },
    ],
    'Espresso': [
      {
        'name': 'Single Espresso',
        'shortDesc': 'Rich Crema',
        'desc': 'A concentrated shot of pure, rich coffee brewed under high pressure.',
        'cost': 2.95,
        'image': 'assets/images/coffee_2.png'
      },
      {
        'name': 'Double Espresso',
        'shortDesc': 'Double Shot',
        'desc': 'Two shots of rich espresso for double the bold coffee flavor.',
        'cost': 3.65,
        'image': 'assets/images/coffee_3.png'
      },
    ],
    'Cappuccino': [
      {
        'name': 'Classic Cappuccino',
        'shortDesc': 'Thick Foam',
        'desc': 'Dark, rich espresso lying in wait under a smoothed and stretched layer of thick foam.',
        'cost': 4.45,
        'image': 'assets/images/coffee_4.png'
      },
      {
        'name': 'Dry Cappuccino',
        'shortDesc': 'Airy Foam',
        'desc': 'Espresso topped almost entirely with airy, thick milk foam.',
        'cost': 4.45,
        'image': 'assets/images/coffee_5.png'
      },
    ],
    'Flat White': [
      {
        'name': 'Flat White',
        'shortDesc': 'Silky Microfoam',
        'desc': 'Bold ristretto shots of espresso infused with silky steamed microfoam.',
        'cost': 4.65,
        'image': 'assets/images/coffee_1.png'
      },
      {
        'name': 'Honey Almond Flat White',
        'shortDesc': 'Sweet & Nutty',
        'desc': 'Ristretto shots blended with almond milk and a touch of natural honey.',
        'cost': 5.25,
        'image': 'assets/images/coffee_2.png'
      },
    ],
    'Mocha': [
      {
        'name': 'Caffè Mocha',
        'shortDesc': 'Bittersweet Chocolate',
        'desc': 'Espresso combined with bittersweet chocolate sauce and steamed milk.',
        'cost': 4.85,
        'image': 'assets/images/coffee_3.png'
      },
      {
        'name': 'White Chocolate Mocha',
        'shortDesc': 'Creamy Cocoa',
        'desc': 'Espresso with white chocolate sauce and milk, finished with whipped cream.',
        'cost': 5.15,
        'image': 'assets/images/coffee_4.png'
      },
    ],
  };

  List<List<dynamic>> chunkDrinks(int itemsPerChunk){
    final drinks = drinksList.values.expand((list)=>list).toList();
    List<List<dynamic>> chunks = [];
    List<dynamic> chunk = [];
    for (final (index, drink) in drinks.indexed){
      chunk.add(drink);
      if(chunk.length == itemsPerChunk || index == drinks.length - 1){
        chunks.add(chunk);
        chunk = [];
      }
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                          children: [
                            Container(
                              color: Theme.of(context).colorScheme.onSurface,
                              height: 290,
                            ),
                            Container(
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
                                  ]
                              ),
                            )
                          ]
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                              children: [
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

                                ...chunkDrinks(2).map((chunk){
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: CoffeeItem(
                                              name: chunk[0]['name'],
                                              desc: chunk[0]['shortDesc'],
                                              cost: chunk[0]['cost'],
                                              image: chunk[0]['image']
                                          )
                                      ),
                                      SizedBox(width: 15),
                                      if (chunk.length > 1)
                                        Expanded(
                                            child: CoffeeItem(
                                                name: chunk[1]['name'],
                                                desc: chunk[1]['shortDesc'],
                                                cost: chunk[1]['cost'],
                                                image: chunk[1]['image']
                                            )
                                        )
                                    ],
                                  );
                                })
                              ]
                          )
                      )
                    ]
                )
            )
        )
      )
    );
  }
}