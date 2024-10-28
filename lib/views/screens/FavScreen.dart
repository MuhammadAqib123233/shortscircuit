import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/controllers/SearchController.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/widgets/CircuitCard.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import '../utills/Colors.dart';
import 'SearchPage.dart';

class FavScreen extends StatefulWidget {
  final int screenIndex;
  const FavScreen({super.key, required this.screenIndex});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation; // Minimum padding value
@override
void initState() {
  super.initState();
 _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
}
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Scaffold(
              backgroundColor: Colors.white,
               body: Stack(
                 children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, top: 10, right: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double screenWidth = constraints.maxWidth;
              double targetFontSize;
              
                   if (screenWidth <= 320) {
                    targetFontSize = 16;
              } else if (screenWidth <= 360) {
                    targetFontSize = 18;
              } else {
                    targetFontSize = 20;
              }
              return Text(
                    "Your saved and favourites locations",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: targetFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
              );
            },
            ),
              ),
              
                         Expanded(
                           child: Container(
                             child: GridView(
                                   padding: EdgeInsets.all(0),
                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2, 
                                   mainAxisSpacing: 20,
                                   crossAxisSpacing: 15// Number of columns in each row
                                   ),
                                   children: [
                                    CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img4.png",
                                      flag_url: "assets/images/flag5.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Brisbane \nBy Night",
                                      color: AppColors().primaryColor,
                                      timings: "3 hours ⬩ 6 stops ⬩ 3.3km",
                                    ),
                                     CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img6.png",
                                      flag_url: "assets/images/flag4.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Los Angeles \nWeird Weekend",
                                      color: AppColors().primaryColor,
                                      timings: "3 hours ⬩ 3 stops ⬩ 5.2km",
                                                           ),
                                       CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img5.png",
                                      flag_url: "assets/images/flag6.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Stockholm quick \nfire reel",
                                      color: AppColors().primaryColor,
                                      timings: "3 hours ⬩ 4 stops ⬩ 7.2km",
                                                           ),
                                   ],
                                 ),
                           ),
                         ),
                      ],
                    ),
              ),
                 ],
               ),
              //     bottomNavigationBar: BottomAppBar(
              //     height: 70,
              //   color: Color(0xffF8F8F8),
              //   elevation: 0, // Remove elevation to make icons align at the center
              //   child: Padding(
              //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween, // Horizontally center the icons
              //     crossAxisAlignment: CrossAxisAlignment.center, // Vertically center the icons
              //     children: [
              //       InkWell(
              //         onTap: (){
              //           Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>HomePage());
              //         },
              //         child: CircleAvatar(
              //           radius: 25,
              //           child: Center(
              //             child: SvgPicture.asset("assets/icons/Home.svg", width: 30, color: Colors.black,),
              //           ),
              //           backgroundColor: Colors.transparent,
              //         ),
              //       ), // Add spacing between icons
              //       InkWell(
              //          onTap: (){
              //           Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>FavScreen());
              //         },
              //         child: CircleAvatar(
              //           radius: 25,
              //           child: Center(
              //             child: SvgPicture.asset("assets/icons/location.svg", color: Colors.white),
              //           ),
              //           backgroundColor: AppColors().primaryColor,
              //         ),
              //       ),
              //       CircleAvatar(
              //         radius: 25,
              //         child: Center(
              //           child: SvgPicture.asset("assets/icons/ai.svg", color: Colors.black),
              //         ),
              //         backgroundColor: Colors.transparent,
              //       ),
              //       CircleAvatar(
              //         radius: 25,
              //         child: Center(
              //           child: SvgPicture.asset("assets/icons/settings.svg", color: Colors.black),
              //         ),
              //         backgroundColor: Colors.transparent,
              //       )
              //     ],
              //   ),
              //   ),
              // ),
            ),
          );
        }
      ),
    );
  }
}