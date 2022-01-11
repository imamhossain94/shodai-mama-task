import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTab  extends StatelessWidget  {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            //height: 400,
            aspectRatio: 16/7,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            enlargeCenterPage: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          )
      ),
    );
  }
}