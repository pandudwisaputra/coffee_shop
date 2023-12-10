import 'package:coffee_shop/providers/map_provider.dart';
import 'package:coffee_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> listProcess = List.generate(4, (index) => index);

    MapProvider mapProvider = Provider.of<MapProvider>(context);

    Widget customBottomNav() {
      return Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 16,
          left: 30,
          right: 30,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffEAEAEA),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '10 minutes left',
              style: addressTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            RichText(
              text: TextSpan(
                text: 'Delivery to ',
                style: subtitleTextStyle5.copyWith(
                  fontSize: 12,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Jl. Kpg Sutoyo',
                    style: addressTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: listProcess
                  .map(
                    (x) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: x >= 3
                                ? const Color(0xffDFDFDF)
                                : const Color(0xff36C07E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: subtitleColor5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: subtitleColor5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/bike.png',
                      width: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered your order',
                        style: addressTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'We deliver your goods to you in the\nshortes possible time.',
                        style: subtitleTextStyle5.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/Image2.png',
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
                        'Johan Hawn',
                        style: addressTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Personal Courier',
                        style: subtitleTextStyle5.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffDEDEDE),
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/telpon.png',
                    width: 24,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-7.541145, 111.659575),
              zoom: 17.0,
            ),
            onMapCreated: (GoogleMapController controller) async {
              mapProvider.setIsMapReady(true);
            },
            markers: {
              const Marker(
                markerId: MarkerId('marker1'),
                position: LatLng(-7.542976, 111.658404),
              ),
              const Marker(
                markerId: MarkerId('marker2'),
                position: LatLng(-7.541145, 111.659575),
              ),
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                      color: Color(0xff130F26),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.asset(
                      'assets/gps.png',
                      width: 24,
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: mapProvider.isMapReady ? customBottomNav() : null,
    );
  }
}
