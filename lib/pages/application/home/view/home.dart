import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/constants.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';
import 'package:ulearn_riverpod/common/widgets/search_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/global.dart';
import 'package:ulearn_riverpod/pages/application/home/providers/home_banner_notifier.dart';
import 'package:ulearn_riverpod/pages/application/home/view/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _controller =
        PageController(initialPage: ref.watch(homeBannerDotsProvider));
  }

//TODO: Prevent 2 scaffolds on top of each other (app,home)
  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: homeAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Text24Normal(
                      text: 'Hello,',
                      color: AppColors.primaryThreeElementText,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Text24Normal(
                      text: Global.storageService
                          .getUserProfile()['age']
                          .toString(),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                searchBar(),
                const SizedBox(
                  height: 20,
                ),
                banner(ref: ref, controller: _controller),
                const HomeMenuBar(),
                CourseGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
