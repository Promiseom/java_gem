import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:java_gem/data/coffee_drink.dart';
import 'package:java_gem/data/coffee_shop_service.dart';
import 'package:java_gem/widgets/coffee_item.dart';
import 'package:java_gem/widgets/promo_banner.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late CoffeeShopService _coffeeService;
  bool _isLoadingDrinksCategories = false;
  bool _isLoadingDrinks = false;

  late List<String> _coffeeDrinkCategories;
  late String _currentDrinksFilter;
  late TabController _tabController;

  @override
  void initState(){
    _coffeeService = CoffeeShopService();
    _coffeeDrinkCategories = _coffeeService.getCoffeeDrinkCategories();
    _currentDrinksFilter = _coffeeDrinkCategories.first;
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  List<List<CoffeeDrink>> chunkDrinks(
      int itemsPerChunk, {
        String drinksFilter = 'All Coffee',
      }) {
    final drinks = _coffeeService.getFilteredDrinks(filter: drinksFilter);
    List<List<CoffeeDrink>> chunks = [];
    List<CoffeeDrink> chunk = [];
    for (final (index, drink) in drinks.indexed) {
      chunk.add(drink);
      if (chunk.length == itemsPerChunk || index == drinks.length - 1) {
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
                                                  color: Theme.of(context).colorScheme.onSurfaceVariant
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
                                // Drinks Filter Tab
                                Container(
                                    margin: EdgeInsets.only(top: 30, bottom:30),
                                    child: DefaultTabController(
                                        length: _coffeeDrinkCategories.length,
                                        child: TabBar(
                                          onTap: (index){
                                            setState((){
                                              _currentDrinksFilter = _coffeeDrinkCategories[index];
                                            });
                                          },
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
                                              ..._coffeeDrinkCategories.map((drink){
                                                return Tab(height: 40, text: drink);
                                              })
                                            ]
                                        )
                                    )
                                ),

                                ...chunkDrinks(2, drinksFilter: _currentDrinksFilter).map((chunk){
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: CoffeeItem(
                                              name: chunk[0].name,
                                              desc: chunk[0].shortDescription,
                                              cost: chunk[0].cost,
                                              image: chunk[0].image
                                          )
                                      ),
                                      SizedBox(width: 15),
                                      if (chunk.length > 1)
                                        Expanded(
                                            child: CoffeeItem(
                                                name: chunk[1].name,
                                                desc: chunk[1].shortDescription,
                                                cost: chunk[1].cost,
                                                image: chunk[1].image
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