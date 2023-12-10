import 'package:coffee_shop/pages/delivery_page.dart';
import 'package:coffee_shop/pages/home/main_page.dart';
import 'package:coffee_shop/pages/onboarding_page.dart';
import 'package:coffee_shop/providers/coffee_provider.dart';
import 'package:coffee_shop/providers/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoffeeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const OnboardingPage(),
          '/main': (context) => const MainPage(),
          '/delivery': (context) => const DeliveryPage(),
        },
      ),
    );
  }
}
