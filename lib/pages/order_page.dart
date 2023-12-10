import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/providers/coffee_provider.dart';
import 'package:coffee_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  final CoffeeModel coffee;
  const OrderPage({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    CoffeeProvider coffeeProvider = Provider.of<CoffeeProvider>(context);

    AppBar appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Order',
          style: titleTextStyle2.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: titleColor,
          ),
        ),
      );
    }

    Widget deliveryAddress() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: titleTextStyle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Jl. Kpg Sutoyo',
              style: addressTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
              style: subtitleTextStyle5.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.5,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffDEDEDE),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/edit.png',
                        width: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit Address',
                        style: addressTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.5,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffDEDEDE),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/note.png',
                        width: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add Note',
                        style: addressTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffEAEAEA),
            ),
          ],
        ),
      );
    }

    Widget item() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Image.asset(
                    coffee.image,
                    width: 54,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.title,
                          style: titleTextStyle2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          coffee.subtitle,
                          style: subtitleTextStyle4.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      coffeeProvider.reduceQuantity();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffEAEAEA),
                        ),
                      ),
                      child: coffeeProvider.quantity == 1
                          ? Image.asset(
                              'assets/minus.png',
                              width: 16,
                              color: const Color(0xffEAEAEA),
                            )
                          : Image.asset(
                              'assets/minus.png',
                              width: 16,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    coffeeProvider.quantity.toString(),
                    style: titleTextStyle2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      coffeeProvider.addQuantity();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffEAEAEA),
                        ),
                      ),
                      child: Image.asset(
                        'assets/plus2.png',
                        width: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 4,
              color: Color(0xffF4F4F4),
            ),
          ],
        ),
      );
    }

    Widget price() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 30,
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffEAEAEA),
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/Discount.png',
                    width: 24,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      '1 Discount is applied',
                      style: titleTextStyle2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: titleColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Payment Summary',
              style: titleTextStyle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: titleTextStyle2,
                ),
                Text(
                  '\$ ${coffee.price}',
                  style: titleTextStyle2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Delivery Fee',
                    style: titleTextStyle2,
                  ),
                ),
                Text(
                  '\$ 2.0',
                  style: titleTextStyle2.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '\$ 1.0',
                  style: titleTextStyle2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffEAEAEA),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: titleTextStyle2,
                ),
                Text(
                  '\$ ${coffee.price + 1.0}',
                  style: titleTextStyle2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget deliver() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          deliveryAddress(),
          item(),
          price(),
        ],
      );
    }

    Widget pickUp() {
      return Center(
        child: Text(
          'Coming Soon...',
          style: titleTextStyle2,
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xffF2F2F2),
            ),
            child: TabBar(
              indicatorWeight: 0,
              labelStyle: titleTextStyle.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 16),
              unselectedLabelStyle: titleTextStyle2.copyWith(fontSize: 16),
              unselectedLabelColor: titleColor,
              labelPadding: const EdgeInsets.all(0),
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 47),
                    child: const Text('Deliver'),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 47),
                    child: const Text('Pick Up'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                deliver(),
                pickUp(),
              ],
            ),
          )
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        padding: const EdgeInsets.only(
          bottom: 8,
          top: 37,
          left: 33,
          right: 33,
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/moneys.png',
                  width: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Cash',
                    style: titleTextStyle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '\$ ${coffee.price + 1.0}',
                  style: titleTextStyle2,
                ),
                const Spacer(),
                Image.asset(
                  'assets/dots.png',
                  width: 24,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/delivery');
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 18),
                alignment: Alignment.center,
                child: Text(
                  'Order',
                  style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: DefaultTabController(
        length: 2,
        child: content(),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
