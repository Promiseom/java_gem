class CoffeeDrink{

  String name;
  String shortDescription;
  String description;
  double cost;
  String image;

  CoffeeDrink({
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.cost,
    required this.image
  });

  factory fromMap(Map<String, dynamic> data){
    try{
      return CoffeeDrink(
          name: data['name'],
          shortDescription: data['shortDesc'],
          description: data['desc'],
          cost: data['cost'],
          image: data['image']
      );
    }catch(e){
      print(e);
      throw Exception('Failed to load drink from provided data');
    }
  }
}