import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    List<Image> images = [
      Image.asset('assets/image7.jpg', fit: BoxFit.cover),
      Image.asset('assets/image3.jpg', fit: BoxFit.cover),
      Image.asset('assets/image4.jpg', fit: BoxFit.cover),
      Image.asset('assets/image5.jpg', fit: BoxFit.cover),
      Image.asset('assets/image6.jpg', fit: BoxFit.cover),
    ];

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: CarouselSlider(
        items: images,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 5,
          aspectRatio: 2.0,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
