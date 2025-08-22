class DrinkModel {
  String drankImage;

  String title;

  String suptitle;

  double price;

  DrinkModel({
    required this.drankImage,
    required this.title,
    required this.price,
    required this.suptitle,
  });

  static List<DrinkModel> drankItem = [
    DrinkModel(
      drankImage: 'assets/Banana.png',
      title: 'Banana',
      price: 185,
      suptitle: '20 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Brownie Island.png',
      title: 'Brownie Island',
      price: 136.5,
      suptitle: '14 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Strawberry.png',
      title: 'Strawberry',
      price: 200,
      suptitle: '15 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Salted Caramel.png',
      title: 'Salted Caramel',
      price: 199.9,
      suptitle: '5 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Chocolate.png',
      title: 'Chocolate',
      price: 175,
      suptitle: '9 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Peanut Butter.png',
      title: 'Banana',
      price: 130,
      suptitle: '17 flavors your drink',
    ),
    DrinkModel(
      drankImage: 'assets/Salted Caramel.png',
      title: 'Salted Caramel',
      price: 184,
      suptitle: '10 flavors your drink',
    ),
  ];
}
