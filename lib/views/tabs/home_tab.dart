import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_task/controllers/home_tab_controller.dart';
import 'package:shodai_mama_task/views/components/custom_product_card.dart';
import 'package:sizer/sizer.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final homeTabController = Get.put(HomeTabController());

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
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            homeTabController.isScrolled(true);
          } else if (scrollNotification is ScrollUpdateNotification) {
            homeTabController.isScrolled(true);
          } else if (scrollNotification is ScrollEndNotification) {
            homeTabController.isScrolled(false);
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: homeTabController.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
                child: NotificationListener(
                  onNotification: (_) => true,
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
              ),
              Container(
                height: 7.5.h,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                color: const Color(0xFF006A4E),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                        child: Text(
                      "Adabor",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    Icon(
                      FontAwesomeIcons.solidMap,
                      color: Colors.white,
                      size: 18.sp,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2.w, 1.2.h, 2.w, 0.4.h),
                child: Text(
                  "ShodaiMama Offers",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFF212121),
                      fontWeight: FontWeight.bold),
                ),
              ),
              // This could be much batter. but task is task
              buildShodaiMamaBBQFestCard(context: context),
              buildProductTitle(
                  context: context,
                  color: Colors.green,
                  title: "Fresh",
                  subtitle:
                      "গুনগত মান বজায় রাখার জন্য পচনশীল খাদ্যপণ্য সরবরাহ করা হয় সকাল ৮-১১ টা পর্যন্ত ।"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: GetX<HomeTabController>(builder: (controller) {
                  return GridView.builder(
                    itemCount: controller.productLists.value.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1.526),
                      crossAxisSpacing: 4.w,
                      mainAxisSpacing: 7.w,
                    ),
                    itemBuilder: (context, index) {
                      return CustomProductCard(controller: controller, index: index,);
                    },
                  );
                }),
              ),
              showMoreButton(),
              buildProductTitle(
                  context: context,
                  color: Colors.blueAccent,
                  title: "Regular",
                  subtitle:
                      "২ ঘন্টার মধ্যে জরুরি প্রয়োজনীয় পণ্যসমূহ সরবরাহ করা হয় সকাল ১০টা-রাত ১০টা পর্যন্ত ।"),
              showMoreButton(),
              buildProductTitle(
                  context: context,
                  color: Colors.purple,
                  title: "Preorder Items",
                  subtitle:
                      "বাজার দরের চেয়ে কম মূল্যে মৌসুমি পণ্য, ঐতিহ্যবাহী খাবার এবং মাসের বাজার সরবরাহ করা হয় ২-৭ দিনে ।"),
              buildShodaiMamaBBQFestCard(context: context, matchParent: true),
              showMoreButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShodaiMamaBBQFestCard(
      {required BuildContext context, bool matchParent = false}) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(2.w),
          width: matchParent
              ? double.infinity
              : MediaQuery.of(context).size.width / 1.65,
          height: matchParent ? 39.h : 29.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(0, 0.5),
                )
              ]),
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/resources/smbbqfest.jpeg")),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "সদাইমামা বার-বি-কিউ ফেস্ট",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF006A4E),
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 12.sp,
                      color: const Color(0xFF006A4E),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductTitle(
      {required BuildContext context,
      required Color color,
      required String title,
      required String subtitle}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            Container(
              height: 11.5.h,
              width: 7,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showMoreButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 30.w,
          padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 2.w),
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFF9C9C9C))),
          child: Row(
            children: [
              Text(
                "Show More",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF9C9C9C),
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                FontAwesomeIcons.chevronRight,
                size: 10.sp,
                color: const Color(0xFF9C9C9C),
              )
            ],
          ),
        ),
      ),
    );
  }
}
