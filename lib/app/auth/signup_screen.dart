import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jwellery_app/app/auth/login_screen.dart';
import 'package:jwellery_app/app/components/label_textfield.dart';
import 'package:jwellery_app/app/screens/product_homescreen.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';
import 'package:jwellery_app/app/theme/theme_constans.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  final usernameController = TextEditingController();
  final firmNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();






  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
        // authProvider=Provider.of<AuthProvider>(context,listen: false);

    // ApiService().loginUser();
  }
  //   void fetchUserData() async {
  //   // Call your API service to get user data
  //   await ApiService().loginUser(); // Assuming this method returns a User object

  //   // Call setState to refresh the UI if needed
  //   setState(() {});
  // }
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
  
    passwordController.dispose();
    usernameController.dispose();
    mobileNumberController.dispose();
    firmNameController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
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
                   Text("Catalogue",style: boldLightBrownMedium.copyWith(fontSize: 42,
                   fontStyle: FontStyle.italic,color: Colors.white.withOpacity(0.7)),),
                
                  const SizedBox(
                    height: 20,
                  ),
                 
                  const SizedBox(
                    height: 20,
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
                        controller: usernameController,
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
                        label: "Firm Name",
                        hintText: "Firm Name",
                        controller: firmNameController,
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
                        label: "Mobile No",
                        hintText: "Mobile No",
                        controller: mobileNumberController,
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
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ), 
            
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 5), // Space between text and button
                      InkWell(
                        onTap: () {
                          // Navigate to the login page or perform your action
                          // Navigator.push(
                          // context,
                          // MaterialPageRoute(builder: (context) => LoginPage()),
                          // );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                           (context)=> const LoginScreen()));
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context)=>const ProductHomescreen()));
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
                       
            
                    
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brown,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 
                ],
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}

