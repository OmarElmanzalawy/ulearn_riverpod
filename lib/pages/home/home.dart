import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/pages/home/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/pages/notifiers/home_nav_notifier.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(homeNavNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: 'Home Page'),
        body: Container(),
        bottomNavigationBar: Container(
          width: 375,
          height: 58,
          decoration: appBoxShadow().copyWith(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
          
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            items: bottomTabs,
            elevation: 0,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            type: BottomNavigationBarType.shifting,
            onTap: (value){
              setState(() {
                index = value;
                ref.read(homeNavNotifierProvider.notifier).updateValue(value);
              });
              print(value);
            },
            
            ),

        ),
      ),
    );
  }
}