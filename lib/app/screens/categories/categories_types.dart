import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwellery_app/app/api%20provider/categoriesapi_provider.dart';
import 'package:jwellery_app/app/bloc/CategoriesBloc/categories_types_event.dart';
import 'package:jwellery_app/app/repositories/categories_repositories.dart.dart';
import 'package:jwellery_app/app/screens/categories/categoriesitems_list_screen.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTypeScreen extends StatefulWidget {
  const CategoriesTypeScreen({super.key});

  @override
  State<CategoriesTypeScreen> createState() => _CategoriesTypeScreenState();
}

class _CategoriesTypeScreenState extends State<CategoriesTypeScreen> {
  final List<String> _categorisImages = [
    'assets/images/BR01.jpg',
    'assets/images/BR24.jpg',
    'assets/images/PCGR32.jpg',
    'assets/images/PS13.jpg',
    'assets/images/PS47.jpg'
  ];
    late CategoriesTypesBloc categoriesTypesBloc;

  @override
  void initState(){
    super.initState();
     categoriesTypesBloc = BlocProvider.of<CategoriesTypesBloc>(context);
    categoriesTypesBloc.add(FetchCategoriesTypes());
    
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Collection",
          style: blueBold.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<CategoriesTypesBloc, CategoriesTypesState>(
           
            builder: (context, state) {
               if(state is CategoriesTypesLoading){
                return const Center(child: CircularProgressIndicator(),);
              
            } else if(state is CategoriesTypesLoaded){
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical, // Vertical scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Two items per row
                  childAspectRatio:
                      0.8, // Adjust to control the height of each item
                  mainAxisSpacing: 10, // Spacing between rows
                  crossAxisSpacing: 0, // Spacing between items
                ),
                itemCount: state.categoriesTypes!.length,
                itemBuilder: (context, index) {
                  // final product = allproducts[index];
                  log("rishi 1");

                  return GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CategoriesitemsListScreen()));
                      // SharedPreferences prefs = await SharedPreferences.getInstance();
                      // prefs.setString('productSlug', product.slug.toString());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
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
                                  child: CachedNetworkImage(
                                    errorWidget: (context,url,error)=>
                                    Image.asset("assets/images/PS13.jpg",fit: BoxFit.cover,),
                                   imageUrl:  state.categoriesTypes![index].imageUrl,
                                    height: 128, // Adjusted for grid
                                    // Full width for grid items
                                    fit: BoxFit.cover,
                                  ),
                                  
                                  
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.categoriesTypes![index].name,
                                        style: fontNormalBlack,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if(state is CategoriesTypesError){
              return const Center(child: Text("state.errorMessage"),);
            }else{
              return const SizedBox(
                height: 250,
                child:  Center(child: Text("No Products available"),));
            }
            },
          ),
        ],
      ),
    );
  }
}
