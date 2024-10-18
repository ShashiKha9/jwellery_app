import 'package:flutter/material.dart';
import 'package:jwellery_app/app/screens/categories/categories_types.dart';
import 'dart:developer';

import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
    final List<String> _categorisImages = [
    'assets/images/BR01.jpg',
    'assets/images/BR24.jpg',
    'assets/images/PCGR32.jpg',
    'assets/images/PS13.jpg',
     'assets/images/PS47.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return 
     
      Column(
        children: [
          GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical, // Vertical scrolling
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two items per row
                        childAspectRatio:
                            0.7, // Adjust to control the height of each item
                        mainAxisSpacing: 10, // Spacing between rows
                        crossAxisSpacing: 5, // Spacing between items
                      ),
                      itemCount: _categorisImages.length,
                      itemBuilder: (context, index) {
                        // final product = allproducts[index];
                            log("rishi 1");
           
           
                        return GestureDetector(
                          onTap: () async{
                              //  Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const CategoriesTypeScreen()));
                                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                                    // prefs.setString('productSlug', product.slug.toString());
                            
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 2.0,left: 6.0,bottom: 15),
                            child: Card(
                              elevation: 3,
                              shadowColor: Colors.black.withOpacity(0.5),
                              color: Colors.white,
                              
                              child:  Stack(
                                children: [
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(13),
                                        topRight: Radius.circular(13)),
                                        child: Stack(
                                          children: [
                                        Image.asset(
                                            _categorisImages[index],
                                            height: 190, // Adjusted for grid
                                            // Full width for grid items
                                            fit: BoxFit.cover,
                                            
                                            
                                          ),
                                           Positioned(
                                          top: 5,
                                          right: 10 ,
                                          child: GestureDetector(
                                            onTap: (){
                                               print("fave");
                                            },
                                            
                                            child:   Icon(Icons.favorite_outline,size: 30,
                                            color: AppColors.white.withOpacity(0.7))),
                                        ),
                                          ]
                                        ),
                                      ),
                                       Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Aligns text to the left
                                          children: [
                                            const  SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Necklace",
                                              style:  fontNormalBlack,
                                              maxLines: 1,
                                            ),
                                            const  SizedBox(
                                              height: 5,
                                            ),
                                            // Text(product.brand!.name.toString()),
                                            // const SizedBox(
                                            //   height: 5,
                                            // ),
                                            // Text(
                                            //   "\$28.0",
                                            //   style: TextStyle(
                                            //     color: Colors.green.shade900,
                                            //     fontWeight: FontWeight.bold,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                       
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                       
          
          
                                           Container(
                                            height: 25,
                                            width: MediaQuery.of(context).size.width/3,
                                            child: ElevatedButton(onPressed: (){},
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: Colors.white.withOpacity(1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: const BorderSide(width: 1,color: AppColors.darkGreen)
                                                
                                                
                                                
                                              )
                                            ),
                                            
                                            child:  Text("ENQUIRY",style: boldBlack.copyWith(fontSize: 10,
                                            color: AppColors.darkGreen),)),
                                          )
          
                                        ],
                                      )
                                    ],
                                  ),
                                  // Positioned heart icon for wishlist
                               
                                 
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    
               ),
        ],
      );
    
  }
}