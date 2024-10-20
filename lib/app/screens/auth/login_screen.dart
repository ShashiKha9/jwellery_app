import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/bloc/CategoriesBloc/categories_types_event.dart';
import 'package:jwellery_app/app/bloc/bloc/auth_bloc_bloc.dart';
import 'package:jwellery_app/app/components/label_textfield.dart';
import 'package:jwellery_app/app/screens/product_homescreen.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  // late AuthProvider authProvider;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // authProvider=Provider.of<AuthProvider>(context,listen: false);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    mobileNoController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(children: [
            Image.asset(
              height: 900,
              'assets/webp_Images/authscreen_image-optimized.webp',
              fit: BoxFit.fitHeight,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Catalogue",
                    style: boldLightBrownMedium.copyWith(
                        fontSize: 42,
                        fontStyle: FontStyle.italic,
                        color: Colors.white.withOpacity(0.7)),
                  ),

                  const SizedBox(
                    height: 150,
                  ),

                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //           child: LabeledTextField(
                  //         label: "First Name",
                  //         hintText: "Type First Name",
                  //         controller: firstNameController,
                  //         isPassword: false,
                  //       )),
                  //       Expanded(
                  //           child: LabeledTextField(
                  //         label: "Last Name",
                  //         hintText: "Type Last Name",
                  //         controller: lastNameController,
                  //         isPassword: false,
                  //       )),
                  //     ]),
                  Column(
                    children: [
                      LabeledTextField(
                        label: "Name",
                        hintText: "Name",
                        controller: mobileNoController,
                        isPassword: false,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: [
                      LabeledTextField(
                        label: "Password",
                        hintText: "Password",
                        isPassword: true,
                        controller: passwordController,
                        hidePassword: true,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  BlocConsumer<AuthBloc, AuthBlocState>(
                      listener: (context, state) {
                    if (state is AuthBlocLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                AppColors.darkBrown),
                          ),
                        ),
                      );
                    } else if (state is AuthBlocSuccess) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductHomescreen()));
                    } else if (state is AuthBlocFailure) {
                      Navigator.pop(context); // Close loading dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }, builder: (context, state) {
                    return SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Add your onPressed code here!

                          // Map<String, String> userData = {
                          //   "name": usernameController.text,
                          //   // Get First Name
                          //   "email": emailController.text,
                          //   "password": passwordController.text,
                          //   "waist": waistController.text,
                          //   "hip": hipController.text,
                          //   "thigh": thighController.text,
                          //   "inseam": inseamController.text,
                          // };
                          // ProductsProvider().saveSizes(
                          //     waistController.text,
                          //     inseamController.text,
                          //     thighController.text,
                          //     hipController.text);

                          // if (_formKey.currentState!.validate()) {
                          //   showDialog(
                          //       context: context,
                          //       builder: (context) => const Center(
                          //             child: CircularProgressIndicator(),
                          //           ));

                          // authProvider
                          //     .userSignUp(
                          //        userData: userData)
                          //     .then((value) {
                          //       Navigator.pop(context);
                          //   if (value) {
                          //     Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => const HomeScreen()));
                          //   }
                          // });

                          // }
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginEvent(
                                mobileNo: mobileNoController.text,
                                password: passwordController.text));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
