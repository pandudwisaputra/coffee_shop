import 'package:coffee_shop/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeProvider with ChangeNotifier {
  final List<CoffeeModel> _listCoffee = [
    CoffeeModel(
      image: 'assets/cappucino 1.png',
      title: 'Cappucino',
      rate: 4.3,
      subtitle: 'with Chocolate',
      price: 4.53,
      description:
          "Indulge in the rich and delightful experience of our Cappuccino with Chocolate, a perfect fusion of bold espresso, velvety steamed milk, and a luxurious touch of decadent chocolate. This artisanal beverage is meticulously crafted to elevate your coffee experience to new heights. Our premium espresso forms the robust base, offering a balanced and intense flavor profile. The smooth and frothy steamed milk adds a layer of creaminess, creating a harmonious blend that dances on your taste buds. What sets our Cappuccino apart is the addition of high-quality chocolate, meticulously integrated to provide a luscious and indulgent twist. The rich cocoa notes complement the coffee's depth, creating a symphony of flavors that will captivate chocolate and coffee enthusiasts alike. Served in a stylish cup, our Cappuccino with Chocolate is not just a beverage; it's a moment of pure bliss. Whether you savor it as a morning pick-me-up or an afternoon treat, this exquisite blend promises to awaken your senses and elevate your coffee ritual.Treat yourself to the perfect union of coffee and chocolate – a delightful symphony that transcends the ordinary and delivers a truly extraordinary taste experience.",
    ),
    CoffeeModel(
      image: 'assets/cappucino 2.png',
      title: 'Cappucino',
      rate: 4.9,
      subtitle: 'with Oat Milk',
      price: 3.90,
      description:
          "delightful and wholesome coffee beverage that combines the rich and robust flavors of a classic cappuccino with the creamy goodness of oat milk. This carefully crafted blend offers a velvety and smooth texture, making it a perfect choice for those seeking a dairy-free and plant-based alternative. Our Cappuccino with Oat Milk features a harmonious balance between the bold espresso shots, frothy oat milk, and a touch of sweetness. The oat milk brings a subtle nuttiness and creaminess to the coffee, enhancing the overall flavor profile. Whether you're a coffee connoisseur or someone looking to explore new and flavorful options, this cappuccino variant provides a satisfying and indulgent experience without compromising on taste. Indulge in the comforting warmth of our Cappuccino with Oat Milk, a versatile and inclusive choice that caters to different dietary preferences. Whether enjoyed alone or paired with your favorite pastry, this beverage promises a delightful and fulfilling coffee experience that transcends traditional boundaries. Elevate your coffee ritual with the unique blend of cappuccino and oat milk, where richness meets plant-based goodness in every sip.",
    ),
    CoffeeModel(
      image: 'assets/cappucino 3.png',
      title: 'Cappucino',
      rate: 4.5,
      subtitle: 'with Chocolate',
      price: 4.53,
      description:
          "Indulge in the rich and delightful experience of our Cappuccino with Chocolate, a perfect fusion of bold espresso, velvety steamed milk, and a luxurious touch of decadent chocolate. This artisanal beverage is meticulously crafted to elevate your coffee experience to new heights. Our premium espresso forms the robust base, offering a balanced and intense flavor profile. The smooth and frothy steamed milk adds a layer of creaminess, creating a harmonious blend that dances on your taste buds. What sets our Cappuccino apart is the addition of high-quality chocolate, meticulously integrated to provide a luscious and indulgent twist. The rich cocoa notes complement the coffee's depth, creating a symphony of flavors that will captivate chocolate and coffee enthusiasts alike. Served in a stylish cup, our Cappuccino with Chocolate is not just a beverage; it's a moment of pure bliss. Whether you savor it as a morning pick-me-up or an afternoon treat, this exquisite blend promises to awaken your senses and elevate your coffee ritual.Treat yourself to the perfect union of coffee and chocolate – a delightful symphony that transcends the ordinary and delivers a truly extraordinary taste experience.",
    ),
    CoffeeModel(
      image: 'assets/cappucino 4.png',
      title: 'Cappucino',
      rate: 4.0,
      subtitle: 'with Oat Milk',
      price: 3.90,
      description:
          "delightful and wholesome coffee beverage that combines the rich and robust flavors of a classic cappuccino with the creamy goodness of oat milk. This carefully crafted blend offers a velvety and smooth texture, making it a perfect choice for those seeking a dairy-free and plant-based alternative. Our Cappuccino with Oat Milk features a harmonious balance between the bold espresso shots, frothy oat milk, and a touch of sweetness. The oat milk brings a subtle nuttiness and creaminess to the coffee, enhancing the overall flavor profile. Whether you're a coffee connoisseur or someone looking to explore new and flavorful options, this cappuccino variant provides a satisfying and indulgent experience without compromising on taste. Indulge in the comforting warmth of our Cappuccino with Oat Milk, a versatile and inclusive choice that caters to different dietary preferences. Whether enjoyed alone or paired with your favorite pastry, this beverage promises a delightful and fulfilling coffee experience that transcends traditional boundaries. Elevate your coffee ritual with the unique blend of cappuccino and oat milk, where richness meets plant-based goodness in every sip.",
    ),
  ];

  List<CoffeeModel> get listCoffee => _listCoffee;

  int _quantity = 1;

  int get quantity => _quantity;

  set quantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

  addQuantity() {
    _quantity++;
    notifyListeners();
  }

  reduceQuantity() {
    if (_quantity != 1) {
      _quantity--;
    }
    notifyListeners();
  }
}
