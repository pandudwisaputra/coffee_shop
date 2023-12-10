import 'package:coffee_shop/pages/home/cart_page.dart';
import 'package:coffee_shop/pages/home/favorite_page.dart';
import 'package:coffee_shop/pages/home/home_page.dart';
import 'package:coffee_shop/pages/home/notification_page.dart';
import 'package:coffee_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Widget bottomNavbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(
                top: 24,
              ),
              child: currentIndex == 0
                  ? Column(
                      children: [
                        Image.asset(
                          'assets/Home.png',
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/Rectangle 1697.png',
                          width: 10,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/Home.png',
                        width: 24,
                        color: const Color(0xff8D8D8D),
                      ),
                    ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(
                top: 24,
              ),
              child: currentIndex == 1
                  ? Column(
                      children: [
                        Image.asset(
                          'assets/Heart.png',
                          width: 24,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/Rectangle 1697.png',
                          width: 10,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/Heart.png',
                        width: 24,
                      ),
                    ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(
                top: 24,
              ),
              child: currentIndex == 2
                  ? Column(
                      children: [
                        Image.asset(
                          'assets/Bag 3.png',
                          width: 24,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/Rectangle 1697.png',
                          width: 10,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/Bag 3.png',
                        width: 24,
                      ),
                    ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(
                top: 24,
              ),
              child: currentIndex == 3
                  ? Column(
                      children: [
                        Image.asset(
                          'assets/Notification.png',
                          width: 24,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/Rectangle 1697.png',
                          width: 10,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/Notification.png',
                        width: 24,
                      ),
                    ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const FavoritePage();
      case 2:
        return const CartPage();
      case 3:
        return const NotificationPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavbar(),
        body: body(),
      ),
    );
  }
}
