import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/image_res.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/pages/application/home/providers/home_banner_notifier.dart';

Widget banner({required WidgetRef ref}) {
  int index = ref.watch(homeBannerDotsProvider);
  return Column(
    children: [
      SizedBox(
          width: 360,
          height: 160,
          child: PageView(
            children: [
              bannerItem(imagepath: ImageRes.banner1),
              bannerItem(imagepath: ImageRes.banner2),
              bannerItem(imagepath: ImageRes.banner3),
            ],
            onPageChanged: (value) {
              ref.read(homeBannerDotsProvider.notifier).setIndex(value);
            },
          ),
          ),
      SizedBox(height: 5,),
      DotsIndicator(
              position: index,
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
            decorator: DotsDecorator(
              color: Colors.blue,
              size: const Size.square(9),
              activeSize: Size(24,8),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            )
    ],
  );
}

Widget bannerItem({String? imagepath}) {
  return Container(
    width: 360,
    height: 160,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagepath?? ImageRes.banner1),
        fit: BoxFit.fill
        ),
    ),
  );
}
