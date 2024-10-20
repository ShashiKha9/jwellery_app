import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/api%20provider/auth_provider.dart';
import 'package:jwellery_app/app/api%20provider/categoriesapi_provider.dart';
import 'package:jwellery_app/app/api%20provider/featuredproductsapi_provider.dart';
import 'package:jwellery_app/app/api%20provider/wishlistapi_provider.dart';
import 'package:jwellery_app/app/screens/auth/login_screen.dart';
import 'package:jwellery_app/app/screens/auth/signup_screen.dart';
import 'package:jwellery_app/app/bloc/CategoriesBloc/categories_types_event.dart';
import 'package:jwellery_app/app/bloc/bloc/auth_bloc_bloc.dart';
import 'package:jwellery_app/app/bloc/featured_products_event.dart';
import 'package:jwellery_app/app/bloc/wish_list_event.dart';
import 'package:jwellery_app/app/repositories/auth_repositories.dart';
import 'package:jwellery_app/app/repositories/categories_repositories.dart.dart';
import 'package:jwellery_app/app/repositories/featured_repositories.dart';
import 'package:jwellery_app/app/screens/categories/categoriesitems_list_screen.dart';
import 'package:jwellery_app/app/screens/detail/productdetail_screen.dart';
import 'package:jwellery_app/app/screens/product_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    // final featuredProductsBloc= FeaturedProductsBloc(featuredRepository: FeaturedRepository(apiProvider: FeaturedApiProvider()));
    return  MultiBlocProvider(
      providers:[
          BlocProvider<CategoriesTypesBloc>(
          create: (context) => CategoriesTypesBloc(
            categoriesRepository: CategoriesRepository(apiProvider: CategoriesApiProvider())),
        ),
           BlocProvider<FeaturedProductsBloc>(
          create: (context) => FeaturedProductsBloc(
            featuredRepository: FeaturedRepository(apiProvider: FeaturedApiProvider()))),

              BlocProvider<WishListBloc>(create: (context){
                final featuredProductsBloc = BlocProvider.of<FeaturedProductsBloc>(context);
                  return WishListBloc(featuredProductsBloc: featuredProductsBloc);
              }),

              BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(authApiProvider: AuthApiProvider()))),

              // BlocProvider<WishListBloc>(create: (context)=> WishListBloc(featuredProductsBloc: featuredProductsBloc))
        
    


      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        theme: 
        ThemeData(
          
          scaffoldBackgroundColor: Colors.grey.shade200.withOpacity(1),
          fontFamily: 'Montserrat', // Change to your preferred font family
      
          // Define default TextField and other text styles
          textTheme: const TextTheme(
            bodySmall: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Montserrat"),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.black, // Label text color
              fontWeight: FontWeight.bold,
            ),
            hintStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey, // Hint text color
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}