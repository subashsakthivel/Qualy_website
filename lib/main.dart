import 'dart:collection';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pink_and_blue/app_styles.dart';
import 'package:pink_and_blue/size_config.dart';

void main() {
  runApp(const AppMain());
}

class AppMain extends StatefulWidget {

  const AppMain({super.key});

  @override
  State<AppMain> createState() => _MainAppState();
}

class _MainAppState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container (
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height : 64,
          child: CustomNavigationBar(
            isFloating: true,
            unSelectedColor: zGrey,
            selectedColor: zWhite,
            backgroundColor: zDarkBrown,
            strokeColor: Colors.transparent,
            borderRadius: const Radius.circular(40),
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                  icon: currentIndex ==0 ?
                  SvgPicture.asset('assets/home_icon_selected.svg') :
                  SvgPicture.asset('assets/home_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: currentIndex ==1 ?
                SvgPicture.asset('assets/cart_icon_selected.svg') :
                SvgPicture.asset('assets/cart_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: currentIndex==2 ?
                SvgPicture.asset('assets/favorite_icon_selected.svg') :
                SvgPicture.asset('assets/favorite_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: currentIndex==3 ?
                SvgPicture.asset('assets/account_icon_selected.svg') :
                SvgPicture.asset('assets/account_icon_unselected.svg'),
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int current = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<String> categories = [
      'All items',
      'dress',
      'hat',
      'watch',
    ];
    List<String> categoriesIcons = [
      'all_items_icon',
      'dress_icon',
      'hat_icon',
      'watch_icon'
    ];
    List<String> images = [
      'image-01',
      'image-02',
      'image-03',
      'image-04',
    ];
    return SafeArea(child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: zPaddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, welcome',
                    style: zEncodeSansNormal.copyWith(
                      color: zDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal!* 2.5,
                    )
                  ),
                  Text(
                      'Hey Subash',
                      style: zEncodeSansBold.copyWith(
                        color: zDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal!* 3,
                      )
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: zGrey,
                backgroundImage: NetworkImage('https://drive.google.com/uc?export=download&id=1-6wHd2gwzdYvk0XRA-XNQlvxxJcL86pX'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: zPaddingHorizontal
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                    style: zEncodeSansNormal.copyWith(
                      color: zDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      prefixIcon : const IconTheme(
                        data: IconThemeData(
                          color: zDarkGrey
                        ),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search Fashion...',
                      border: zInputBorder,
                      enabledBorder: zInputBorder,
                      disabledBorder: zInputBorder,
                      focusedErrorBorder: zInputBorder,
                      focusedBorder: zInputBorder,
                      errorBorder: zInputBorder,
                      hintStyle: zEncodeSansNormal.copyWith(
                        color: zDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      )
                    ),
                  ),
              ),
              const SizedBox(width: 16,),
              Container(
                height: 49,
                width: 49,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(zBorderRadius),
                  color: zBlack,
                ),
                child: SvgPicture.asset('assets/filter_icon.svg'),
              )
            ],
          ),
        ),
        const SizedBox(height: 24,),
        SizedBox(
          width: double.infinity,
          height: 36,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder : (context , index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: index==0 ? zPaddingHorizontal : 15,
                    right: index==categories.length-1 ? zPaddingHorizontal : 0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  height: 36,
                  decoration: BoxDecoration(
                    color: index == current ? zBlack : zWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: index==current ? null : Border.all(
                      color: zLightGrey,
                      width: 1
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/${categoriesIcons[index]}_${current==index? 'selected.svg' : 'unselected.svg'}',
                      ),
                      const SizedBox(width: 4,),
                      Text(categories[index],
                        style: zEncodeSansMedium.copyWith(
                          color: current==index ? zWhite : zDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
        ),
        const SizedBox(
          height: 32,
        ),
        MasonryGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 20,
          mainAxisSpacing: 23,
          crossAxisCount: 2,
          itemCount: images.length,
          padding: const EdgeInsets.symmetric(
            horizontal: zPaddingHorizontal
          ),
          itemBuilder: (context , index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: ClipRect(
                          child: Image.asset(
                            'assets/images/${images[index]}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                    Positioned(
                      right : 12,
                      top : 10,
                      child : GestureDetector(
                        onTap : () {},
                        child: SvgPicture.asset(
                        'assets/favorite_cloth_icon_unselected.svg'
                        )
                      )
                    ),
                  ],
                ),
                const SizedBox(height : 8),
                Text(
                    "Modern light cloths",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                   style: zEncodeSansSemiBold.copyWith(
                     color: zDarkBrown,
                     fontSize: SizeConfig.blockSizeHorizontal! * 2,
                   ),
                ),
                Text(
                  "Modern world",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: zEncodeSansNormal.copyWith(
                    color: zGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 1,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        '\$212.0',
                        style: zEncodeSansSemiBold.copyWith(
                          color: zDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2
                        ),
                    ),
                    const SizedBox(width: 8,),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: zYellow,
                        ),
                        Text(
                          '5.0',
                          style: zEncodeSansNormal.copyWith(
                          color: zDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2
                          ),
                        )
                      ]
                    )
                  ],
                )
              ],
            );
          },
        )
      ],
    ));
  }
}

