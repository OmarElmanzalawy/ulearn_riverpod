import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/image_res.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/application/home/providers/home_banner_notifier.dart';

Widget banner({required WidgetRef ref, required PageController controller}) {
  int index = ref.watch(homeBannerDotsProvider);
  return Column(
    children: [
      SizedBox(
        width: 360,
        height: 160,
        child: PageView(
          controller: controller,
          children: [
            bannerItem(imagepath: ImageRes.banner1),
            bannerItem(imagepath: ImageRes.banner2),
            bannerItem(imagepath: ImageRes.banner3),
          ],
          onPageChanged: (value) {
            ref.read(homeBannerDotsProvider.notifier).setIndex(value);
            print(ref.read(homeBannerDotsProvider.notifier).state);
          },
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      DotsIndicator(
        position: index,
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            color: Colors.blue,
            size: const Size.square(9),
            activeSize: const Size(24, 8),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
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
          image: AssetImage(imagepath ?? ImageRes.banner1), fit: BoxFit.fill),
    ),
  );
}

AppBar homeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(imagePath: ImageRes.menu),
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(ImageRes.profilePhoto))),
            ),
          )
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text16Normal(
            text: 'Choose your course',
            color: AppColors.primaryText,
            weight: FontWeight.bold,
          ),
          GestureDetector(
            child: Text14Normal(
              text: 'See all',
              color: AppColors.primaryThreeElementText,
              weight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
