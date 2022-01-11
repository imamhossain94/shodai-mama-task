import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/resources/slide1.jpeg",
    "assets/resources/slide2.png",
    "assets/resources/slide3.png",
    "assets/resources/slide4.png",
    "assets/resources/slide5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: CarouselSlider.builder(
                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.fill)),
                  );
                },
                enableAutoSlider: true,
                slideTransform: const ParallaxTransform(),
                slideIndicator: CircularSlideIndicator(
                  indicatorRadius: 3,
                  itemSpacing: 10,
                  padding: const EdgeInsets.only(bottom: 12),
                ),
                itemCount: images.length),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: const Color(0xFF006A4E),
            child: Row(
              children: const [
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: Text(
                  "Adabor",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                Icon(
                  FontAwesomeIcons.mapMarkedAlt,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
