import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailState();
}

@override
Widget build(BuildContext context) {
  return const Placeholder();
}

class _ProductDetailState extends State<ProductDetailScreen> {
    final List<String> _productsImages = [
    'assets/images/BR01.jpg',
    'assets/images/BR24.jpg',
    'assets/images/PCGR32.jpg',
    'assets/images/PS13.jpg',
    'assets/images/PS47.jpg'
  ];


  final PageController _pageController = PageController();
  int _currentPage = 0;
 
    bool isLoading = true;


  @override
  void initState()  {
    super.initState();
    
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    // fetchProductDetail();
   
 
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      
      body: SafeArea(
        child: SingleChildScrollView(           
          child:   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  SizedBox(
                    height: 350,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _productsImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      //   return CachedNetworkImage(
                      //  imageUrl:   productsDetail.first.productImages!.isNotEmpty
                      //                     ? '${ApiUrl.baseUrl}${productsDetail.first.productImages![index]}'
                      //                     : '',
            
                      //     fit: BoxFit.fill,
                      //   );
                      return Image.asset(_productsImages[index],
                      fit: BoxFit.cover,
                      );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20, 
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_productsImages.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          );
                        })),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
                 Padding(
                padding:  const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                 
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                        "Antique Pendant",
                        
                        ),
                       
                              
                       
                     
                    ],
                  ),
                    GestureDetector(child: const Icon(Icons.favorite_border_outlined)),
                        const  SizedBox(
                          height: 10,
                        ),
                  ]
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                   SizedBox(
                    width: 20,
                  ),
                  //  Text(
                  //   "Color:",
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  //  SizedBox(
                  //   width: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: colors.map((color) {
                  //     return GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedColor = color;
                  //         });
                  //       },
                  //       child: Container(
                  //         margin: const EdgeInsets.all(5),
                  //         width: 80,
                  //         height: 40,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: Colors.grey.shade300,
                  //             ),
                  //             color: selectedColor == color
                  //                 ? Colors.black
                  //                 : Colors.transparent),
                  //         child: Center(
                  //             child: Text(
                  //           color,
                  //           style: TextStyle(
                  //               color: selectedColor == color
                  //                   ? Colors.white
                  //                   : Colors.black),
                  //         )),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
              const Divider(
                height: 2,
                indent: 17,
                endIndent: 17,
              ),
              const SizedBox(
                height: 20,
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                   const  SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Product" ,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Divider(
                height: 2,
                indent: 17,
                endIndent: 17,
              ),
            ]),
          
          
        ),
      )
    );
  }
}
