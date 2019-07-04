import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TopBanner extends StatelessWidget {
  final List<Widget> imageList = <Widget>[
    Image.asset('images/bg0.jpeg', fit: BoxFit.fitWidth),
    Image.asset('images/bg1.jpeg', fit: BoxFit.fitWidth),
    Image.asset('images/bg2.jpeg', fit: BoxFit.fitWidth),
  ];

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) => imageList[index],
        itemCount: 3,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Colors.yellow[500])
        ),
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ));
}
