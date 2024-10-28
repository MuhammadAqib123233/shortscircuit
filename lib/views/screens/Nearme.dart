import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/SearchPage.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/CategoryCard.dart';
import 'package:shortscircuit/views/widgets/CircuitCard.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import '../../controllers/SearchController.dart';

class Nearme extends StatefulWidget {
  const Nearme();

  @override
  State<Nearme> createState() => _NearmeState();
}

class _NearmeState extends State<Nearme> with SingleTickerProviderStateMixin {
   late AnimationController _animationController;
  late Animation _animation;
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
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
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
                                  "Showing all circuits near you",
                                  style: GoogleFonts.plusJakartaSans(
                                          fontSize: targetFontSize,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
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
                                      imageUrl: "assets/images/img13.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Secret history of \nManchester",
                                      color: Color(0xffCACACA),
                                      timings: "3 hours ⬩ 7 stops ⬩ 3.9km",
                                    ),
                                     CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img14.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Manchester \nMusic locations",
                                      color: Color(0xffCACACA),
                                      timings: "4 hours ⬩ 5 stops ⬩ 5.2km",
                                                           ),
                                       CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img15.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Top 5 buildings in \nManchester story",
                                      color: Color(0xffCACACA),
                                      timings: "3 hours ⬩ 4 stops ⬩ 7.2km",
                                                           ),
                                       CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img16.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Manchester \nultimate",
                                      color: Color(0xffCACACA),
                                      timings: " 5 hours ⬩ 9 stops ⬩ 4.5km",
                                                           ),
                                      CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img17.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "Parks of Bankok",
                                      color:Color(0xffCACACA),
                                      timings: "3 hours . 3 stops . 7.2km",
                                                           ),
                                       CircuitCard(
                                      tl_tr_br_radius: 10,
                                      bl_radius: 30,
                                      imageUrl: "assets/images/img18.png",
                                      flag_url: "assets/images/flag2.png",
                                      width: 200.0,
                                      height: 230.0,
                                      title: "'Hangover' movie \n locations reel",
                                      color: Color(0xffCACACA),
                                      timings: "4 hours . 6 stops . 5.5km",
                                                           ),
                                   ],
                                 ),
                           ),
                         ),
                      ],
                    ),
              ),
              // AnimatedContainer(
              //      duration: Duration(milliseconds: 500),
              //     margin: EdgeInsets.only(bottom: isSearch ? 0 : MediaQuery.of(context).size.height,),
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     decoration: BoxDecoration(
              //       color: AppColors().primaryColor
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 0),
              //       child: SingleChildScrollView(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               height: 200,
              //               child: ListView(
              //                 children: [
              //                   InkWell(
              //                     onTap: (){
              //                       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Bangkok", isSearch: false,));
              //                     },
              //                     child: SuggestionTile(suggestionTitle: "Bangkok (City)",)
              //                     ),
              //                   InkWell(
              //                     onTap: (){
              //                       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Baltimore", isSearch: false)
              //                       );
              //                     },
              //                     child: SuggestionTile(suggestionTitle: "Baltimore (City)")),
              //                   InkWell(
              //                     onTap: (){
              //                       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Baku", isSearch: false));
              //                     },
              //                     child: SuggestionTile(suggestionTitle: "Baku (City)")),
              //                   InkWell(
              //                     onTap: (){
              //                       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Bartan Superdrome", isSearch: false));
              //                     },
              //                     child: SuggestionTile(suggestionTitle: "Bartan Superdrome (Landmark)"))
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 50),
              //               child: Text(
              //                       "Recent Searches",
              //                       style: GoogleFonts.plusJakartaSans(
              //                          fontSize: 16,
              //                          fontWeight: FontWeight.w700,
              //                          color: Colors.white,
              //                          decoration: TextDecoration.none
              //                        ),
              //                     ),
              //             ),
              //             //  Container(
              //             //   height: 300,
              //             //   child: ListView(
              //             //     children: [
              //             //       SuggestionTile(suggestionTitle: "Night markets of Shanghai"),
              //             //     ],
              //             //   ),
              //             //              ),
              //              Container(
              //               width: MediaQuery.of(context).size.height,
              //               child: SuggestionTile(suggestionTitle: "Night markets of Shanghai")),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
                 ],
               ),
              //  bottomNavigationBar: BottomAppBar(
              //     height: 70,
              //   color: Color(0xffF8F8F8),
              //   elevation: 0, // Remove elevation to make icons align at the center
              //   child: Padding(
              //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween, // Horizontally center the icons
              //     crossAxisAlignment: CrossAxisAlignment.center, // Vertically center the icons
              //     children: [
              //   InkWell(
              //     onTap: (){
              //       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>HomePage());
              //     },
              //     child: CircleAvatar(
              //       radius: 25,
              //       child: Center(
              //         child: SvgPicture.asset("assets/icons/Home.svg", width: 30, color: Colors.white,),
              //       ),
              //       backgroundColor: AppColors().primaryColor,
              //     ),
              //   ), // Add spacing between icons
              //   InkWell(
              //      onTap: (){
              //       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>FavScreen());
              //     },
              //     child: CircleAvatar(
              //       radius: 25,
              //       child: Center(
              //         child: SvgPicture.asset("assets/icons/location.svg", color: Colors.black),
              //       ),
              //       backgroundColor: Colors.transparent,
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 25,
              //     child: Center(
              //       child: SvgPicture.asset("assets/icons/ai.svg", color: Colors.black),
              //     ),
              //     backgroundColor: Colors.transparent,
              //   ),
              //   CircleAvatar(
              //     radius: 25,
              //     child: Center(
              //       child: SvgPicture.asset("assets/icons/settings.svg", color: Colors.black),
              //     ),
              //     backgroundColor: Colors.transparent,
              //   )
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