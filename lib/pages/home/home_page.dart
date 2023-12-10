import 'package:coffee_shop/providers/coffee_provider.dart';
import 'package:coffee_shop/theme.dart';
import 'package:coffee_shop/widgets/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CoffeeProvider coffeeProvider = Provider.of<CoffeeProvider>(context);

    Widget background() {
      return Column(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff131313),
                  Color(0xff313131),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.9],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: backgroundColor,
              width: double.infinity,
            ),
          )
        ],
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 63,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Location',
                  style: subtitleTextStyle2.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Bilzen, Tanjungbalai',
                      style: subtitleTextStyle3.copyWith(
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.expand_more,
                      size: 22,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
            Image.asset(
              'assets/Image.png',
              width: 44,
            ),
          ],
        ),
      );
    }

    Widget search() {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xff313131),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Image.asset(
                  'assets/search-normal.png',
                  width: 20,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextFormField(
                  style: titleTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search coffee',
                    hintStyle: textFieldTextStyle,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/furnitur-icon.png',
                  width: 20,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget promo() {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Image.asset(
          'assets/Frame 17.png',
          width: double.infinity,
        ),
      );
    }

    Widget categories() {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorWeight: 0,
                labelStyle:
                    titleTextStyle.copyWith(fontWeight: FontWeight.w600),
                unselectedLabelStyle: labelTextStyle,
                unselectedLabelColor: labelColor,
                labelPadding: const EdgeInsets.all(0),
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: const Text(
                        'Cappuccino',
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: const Text(
                        'Machiato',
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: const Text(
                        'Latte',
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: const Text(
                        'Americano',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget cappuccino() {
      return GridView.builder(
        itemCount: coffeeProvider.listCoffee.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 4 / 6.3,
        ),
        itemBuilder: (context, index) {
          return CoffeeCard(
            coffee: coffeeProvider.listCoffee[index],
          );
        },
      );
    }

    Widget machiato() {
      return const Center(
        child: Text('Coming soon...'),
      );
    }

    Widget latte() {
      return const Center(
        child: Text('Coming soon...'),
      );
    }

    Widget americano() {
      return const Center(
        child: Text('Coming soon...'),
      );
    }

    Widget listCoffee() {
      return Expanded(
        child: TabBarView(
          children: [
            cappuccino(),
            machiato(),
            latte(),
            americano(),
          ],
        ),
      );
    }

    return Stack(
      children: [
        background(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                header(),
                search(),
                promo(),
                categories(),
                listCoffee(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
