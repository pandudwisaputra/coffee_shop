import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/pages/order_page.dart';
import 'package:coffee_shop/theme.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatelessWidget {
  final CoffeeModel coffee;
  const DetailItemPage({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Detail',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/Heart2.png',
                width: 24,
              ),
            ),
          )
        ],
      );
    }

    Widget itemInformation() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                coffee.image,
                width: double.infinity,
                height: 226,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              coffee.title,
              style: titleTextStyle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.subtitle,
                      style: subtitleTextStyle4.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Vector.png',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${coffee.rate} ',
                          style: titleTextStyle2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '(230)',
                          style: subtitleTextStyle5.copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/bean.png',
                    width: 24,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/milk.png',
                    width: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xffEAEAEA),
              thickness: 1,
            )
          ],
        ),
      );
    }

    Widget description() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: titleTextStyle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ReadMore(text: coffee.description),
          ],
        ),
      );
    }

    Widget size() {
      return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                'Size',
                style: titleTextStyle2.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizeCard()
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        padding: const EdgeInsets.only(
          top: 33,
          bottom: 16,
          left: 33,
          right: 27,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 50.0,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Price',
                  style: subtitleTextStyle4,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$ ${coffee.price}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(
                      coffee: coffee,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 21,
                  horizontal: 72,
                ),
                child: Text(
                  'Buy Now',
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          itemInformation(),
          description(),
          size(),
        ],
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}

class ReadMore extends StatefulWidget {
  final String text;
  const ReadMore({
    super.key,
    required this.text,
  });

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: subtitleTextStyle4,
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Read Less' : 'Read More',
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class SizeCard extends StatefulWidget {
  const SizeCard({super.key});

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  final List<String> _sizeItems = ['S', 'M', 'L'];
  String _sizeSelected = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _sizeItems
          .map(
            (x) => Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _sizeSelected = x;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: _sizeSelected == x
                        ? const Color(0xffFFF5EE)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _sizeSelected == x
                          ? primaryColor
                          : const Color(0xffDEDEDE),
                    ),
                  ),
                  child: Text(
                    x,
                    style:
                        _sizeSelected == x ? primaryTextStyle : titleTextStyle2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
