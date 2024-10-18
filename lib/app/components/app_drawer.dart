import 'package:flutter/material.dart';
import 'package:jwellery_app/app/wishlist/wishlist_screen.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});

  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late String userName;
  late String userMail;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,      
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset(AppLogos.kidoLogo, height: 140),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                    ),
                    child: const Icon(Icons.person_2_outlined,color: Colors.white,size: 42,),
                  ),
                
                     const Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                       child:  Text(
                                           "User",
                                           style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                                           ),
                                         ),
                     )
                  
                ],
              ),
            ),
          ),
          const Divider(
            height: 2,
          ),
           ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList ? 2 : 1);
              },
              visualDensity: const VisualDensity(vertical:  -4),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text(
                "Collection",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
               ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList ? 2 : 1);
              },
              visualDensity: const VisualDensity(vertical:  -4),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text(
                "Antique",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
               ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList ? 2 : 1);
              },
              visualDensity: const VisualDensity(vertical:  -4),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text(
                "Collection",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
          const SizedBox(height: 20),
          // Leads
          // if (leadList)
             ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList ? 2 : 1);
              },
              visualDensity: const VisualDensity(vertical:  -4),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text(
                "Kundan",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
              ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList ? 2 : 1);
              },
              visualDensity: const VisualDensity(vertical:  -4),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text(
                "American Diamond",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
            const SizedBox(height: 10),


          // // Follow Up
          // if (followupList)
            ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(1);
              },
              visualDensity: const VisualDensity(vertical: -4),
              leading: const Icon(Icons.account_box_sharp),
              title: const Text(
                "Components",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
             const SizedBox(height: 10),

          // Add Leads
          // if (leadList && addLead)
            ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(1);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>const WishListScreen()));
              
              },
              leading: const Icon(Icons.favorite_outline_rounded),
              title: const Text(
                "WishList",
                // style: montserratNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
             const SizedBox(height: 10),
          // if (contentView)
            ListTile(
              onTap: () {
                Navigator.pop(context);
                // tabManager.onTabChanged(followupList && leadList
                //     ? 3
                //     : !followupList && !leadList
                //         ? 1
                //         : 2);
              },
              visualDensity: const VisualDensity(vertical: -4),
              leading: const Icon(
                Icons.workspaces_rounded
              ),
              title: const Text(
                "Orders",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),
             const SizedBox(height: 10),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(
              //   // getContext(context.read<AuthProvider>().currentIndex)!,
              //   // Routes.myProfile,
              // );
            },
            visualDensity: const VisualDensity(vertical: -4),
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text(
              "My Cart",
              // style: blueNormal.copyWith(
              //   color: Colors.black,
              //   fontSize: 15,
              // ),
            ),
          ),
           const SizedBox(height: 10),

          

          // QR Code
          // if (authProvider.userModel?.employee.countryId.length == 1)
            ListTile(
              onTap: () {
                Navigator.pop(context);
                // showDialog(
                //   context: context,
                //   builder: (context) => const QrDialog(),
                // );
              },
              visualDensity: const VisualDensity(vertical: -4),
              leading: const SizedBox(
                height: 20,
                width: 20,
                child:  Icon(
                  Icons.person_4_outlined
                ),
              ),
              title: const Text(
                "Profile",
                // style: blueNormal.copyWith(
                //   color: Colors.black,
                //   fontSize: 15,
                // ),
              ),
            ),

          // Share app
         

          // Logout
          
        ],
      ),
    );
  }

  // BuildContext? getContext(int index) {
  //   BuildContext? currentContext;
  //   switch (index) {
  //     case 0:
  //       currentContext = dashboardScreenKey.currentContext!;
  //       break;
  //     case 1:
  //       currentContext = followUpScreenKey.currentContext!;
  //       break;
  //     case 2:
  //       currentContext = leadsScreenKey.currentContext!;
  //       break;
  //     case 3:
  //       currentContext = responseScreenKey.currentContext!;
  //       break;
  //   }
  //   return currentContext;
  // }
}
