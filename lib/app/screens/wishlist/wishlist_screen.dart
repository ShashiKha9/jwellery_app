import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/bloc/featured_products_event.dart';
import 'package:jwellery_app/app/bloc/wish_list_event.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';
import 'dart:developer';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListState();
}

class _WishListState extends State<WishListScreen> {
  late WishListBloc wishListBloc;

  @override
  void initState() {
    super.initState();
    // WishlistRepository(apiProvider: WishlistApiProvider());
    wishListBloc = context.read<WishListBloc>();
    wishListBloc.add(FetchWishlist());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: blueBold.copyWith(color: AppColors.brown),
        ),
        elevation: 3,
        shadowColor: AppColors.brown.withOpacity(0.5),
        actions: const [Icon(Icons.search)],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<WishListBloc, WishListState>(
              builder: (context, state) {
                if (state is WishListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WishListLoaded) {
                  log('Wishlist has ${state.wishlistProducts.length} items');

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical, // Vertical scrolling
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      childAspectRatio:
                          0.7, // Adjust to control the height of each item
                      mainAxisSpacing: 10, // Spacing between rows
                      crossAxisSpacing: 0, // Spacing between items
                    ),
                    itemCount: state.wishlistProducts.length,
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
                              right: 5, left: 5, bottom: 15),
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
                                      child: Stack(children: [
                                        CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'assets/images/PS42.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                          imageUrl: state
                                              .wishlistProducts[index].imageUrl,
                                          height: 190, // Adjusted for grid
                                          // Full width for grid items
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 5,
                                          right: 10,
                                          child: GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<
                                                            FeaturedProductsBloc>(
                                                        context)
                                                    .add(AddWishList(
                                                        categoryId: state
                                                            .wishlistProducts[
                                                                index]
                                                            .id));
                                              },
                                              child: Icon(
                                                  state.wishlistProducts[index]
                                                          .isFavorite
                                                      ? Icons.favorite_outlined
                                                      : Icons
                                                          .favorite_outline_sharp,
                                                  size: 30,
                                                  color: state
                                                          .wishlistProducts[
                                                              index]
                                                          .isFavorite
                                                      ? AppColors.red
                                                          .withOpacity(0.5)
                                                      : AppColors.white
                                                          .withOpacity(0.7))),
                                        ),
                                      ]),
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
                                            state.wishlistProducts[index].name,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.white
                                                      .withOpacity(1),
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
                } else if (state is WishListError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: Text("No WishList Products"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
