import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/image_res.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
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
    return Column(
      children: [
        Container(
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
        ),
        //course item buttons
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              decoration: appBoxShadow(color: AppColors.primaryElement,radius: 7),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Text11Normal(
              text: 'All',
              color: AppColors.primaryElementText,
            ),
            ),
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            //decoration: 'Popular',
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Text11Normal(
              text: 'Popular',
              color: AppColors.primaryThreeElementText,
            ),
            ),
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            //decoration: appBoxShadow(color: AppColors.primaryElement,radius: 7),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Text11Normal(
              text: 'Newest',
              color: AppColors.primaryThreeElementText,
            ),
            )
          ],
        )
      ],
    );
  }
}

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 40,mainAxisSpacing: 40),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                   
                  itemBuilder: (context,int index){
                    return appImage();
                  }
                  ),
                );
  }
}
