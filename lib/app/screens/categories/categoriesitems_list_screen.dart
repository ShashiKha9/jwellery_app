import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/bloc/featured_products_event.dart';
import 'package:jwellery_app/app/components/app_drawer.dart';
import 'dart:developer';

import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';

class CategoriesitemsListScreen extends StatefulWidget {
  const CategoriesitemsListScreen({super.key});

  @override
  State<CategoriesitemsListScreen> createState() =>
      _CategoriesitemsListScreenState();
}

class _CategoriesitemsListScreenState extends State<CategoriesitemsListScreen> {
  final List<String> _categorisImages = [
    'assets/images/BR01.jpg',
    'assets/images/BR24.jpg',
    'assets/images/PCGR32.jpg',
    'assets/images/PS13.jpg',
    'assets/images/PS47.jpg'
  ];

    late FeaturedProductsBloc featuredProductBloc;

    bool isAddedWishlist=false;

  @override
  void initState(){
    super.initState();
     featuredProductBloc = context.read<FeaturedProductsBloc>();
    featuredProductBloc.add(FetchedFeaturedProducts());

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
        actions: const [Icon(Icons.search)],
      ),
      drawer:  AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
           const  SizedBox(
              height: 25,
            ),
             Container(
              height: 80,
              width: MediaQuery.of(context).size.width/1,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child:  const Center(child: Text("Pendant Gold")),
            ),
            BlocBuilder<FeaturedProductsBloc, FeaturedProductsState>(
              builder: (context, state) {
                if(state is FeaturedProductsLoading){
                  return const Center(child: CircularProgressIndicator(),);
                } else if(state is FeaturedProductsLoaded){
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical, // Vertical scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items per row
                    childAspectRatio:
                        0.7, // Adjust to control the height of each item
                    mainAxisSpacing: 10, // Spacing between rows
                    crossAxisSpacing: 0, // Spacing between items
                  ),
                  itemCount: state.featuredProducts!.length,
                  itemBuilder: (context, index) {
                    // final product = allproducts[index];
                    log("rishi 1");

                    return GestureDetector(
                      onTap: () async {
                        //  Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CategoriesTypeScreen()));
                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs.setString('productSlug', product.slug.toString());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 5,left: 5,bottom: 15),
                        child: Card(
                          elevation: 3,
                          shadowColor: Colors.black.withOpacity(0.5),
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(13),
                                        topRight: Radius.circular(13)),
                                    child: Stack(
                                      children: [
                                     CachedNetworkImage(
                                      errorWidget: (context,url,error)=>Image.asset('assets/images/PS42.jpg',
                                      fit: BoxFit.cover,),
                                      imageUrl:  state.featuredProducts![index].imageUrl,
                                        height: 190, // Adjusted for grid
                                        // Full width for grid items
                                        fit: BoxFit.cover,
                                      ),
                                         Positioned(
                                          top: 5,
                                          right: 10 ,
                                          child: GestureDetector(
                                            onTap: (){
                                            BlocProvider.of<FeaturedProductsBloc>(context).add(
                                                AddWishList(categoryId: state.featuredProducts![index].id));
                                                setState(() {
                                                  
                                                });
                                                
                                            },
                                            
                                            
                                           child: Icon(state.featuredProducts![index].isFavorite? 
                                           Icons.favorite_outlined:
                                           Icons.favorite_outline_sharp,size: 30,
                                            color:state.featuredProducts![index].isFavorite?
                                             AppColors.red.withOpacity(0.5):
                                             AppColors.white.withOpacity(0.7))),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Aligns text to the left
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          state.featuredProducts![index].name,
                                          style: fontNormalBlack,
                                          maxLines: 1,
                                        ),
                                        const SizedBox(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                       
                                      Container(
                                        height: 25,
                                        width: MediaQuery.of(context).size.width/3,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.white.withOpacity(1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: const BorderSide(
                                                        width: 1,
                                                        color: AppColors
                                                            .darkGreen))),
                                            child: Text(
                                              "ENQUIRY",
                                              style: boldBlack.copyWith(
                                                  fontSize: 10,
                                                  color: AppColors.darkGreen),
                                            )),
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
                );
                } else if(state is FeaturedProductsError){
                  return Center(child: Text(state.message),);
                }else{
                  return const Center(child: Text("No Products available"),);
                }
               
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Header',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100.0; // Maximum height of the header

  @override
  double get minExtent => 60.0; // Minimum height of the header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Return true if you want to rebuild the header when parameters change
  }
}
