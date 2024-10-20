import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jwellery_app/app/components/app_drawer.dart';

import 'package:jwellery_app/app/components/products_list.dart';
import 'package:jwellery_app/app/screens/categories/categories_types.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';

class ProductHomescreen extends StatefulWidget {
  const ProductHomescreen({super.key});

  @override
  State<ProductHomescreen> createState() => _ProductHomescreenState();
}

class _ProductHomescreenState extends State<ProductHomescreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _bannerImages = [
    'https://via.placeholder.com/600x200/FF5733/FFFFFF?text=Banner+1',
    'https://via.placeholder.com/600x200/33FF57/FFFFFF?text=Banner+2',
    'https://via.placeholder.com/600x200/3357FF/FFFFFF?text=Banner+3',
  ];

  @override
  void initState() {
    super.initState();
    _bannerSlide();
    _pageController = PageController();
  }

  void _bannerSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _bannerImages.length) {
        _currentPage++;
      } else if (_currentPage >= _bannerImages.length) {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jewellery",
          style: blueBold.copyWith(color: AppColors.brown),
        ),
        elevation: 3,
        shadowColor: AppColors.brown.withOpacity(0.5),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _bannerImages.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_bannerImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Banner ${index + 1}',
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Categories",
                    style: boldLightBrownMedium.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500))),
            BrowseCategories(),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: Text("Featured Products",
                    style: boldLightBrownMedium.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500))),
            const SizedBox(
              height: 10,
            ),
            const ProductsList()
          ],
        ),
      ),
    );
  }
}

class BrowseCategories extends StatelessWidget {
  BrowseCategories({
    super.key,
  });

  final List<String> _categorisImages = [
    'assets/images/BR01.jpg',
    'assets/images/BR24.jpg',
    'assets/images/PCGR32.jpg',
    'assets/images/PS13.jpg',
    'assets/images/PS47.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          itemCount: _categorisImages.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const CategoriesTypeScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;
                              var tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            }));
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_categorisImages[index])),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.all(10),
                  ),
                ),
                const Text("Collection")
              ],
            );
          }),
    );
  }
}
