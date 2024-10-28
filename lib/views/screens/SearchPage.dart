import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/controllers/PageRouteController.dart';
import 'package:shortscircuit/controllers/SearchController.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/FoodCategory.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import '../utills/Colors.dart';
import '../widgets/CategoryCard.dart';
import '../widgets/CircuitCard.dart';

class SearchPage extends StatefulWidget {
  final String searchResults; 
  bool isSearch = false;
  SearchPage({super.key, required this.searchResults, this.isSearch=false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //     elevation: 0,
        //     leading: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 16.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 2),
        //             child: Image.asset("assets/images/logo.png"),
        //           ),
        //           InkWell(
        //             onTap: (){
        //               Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>Nearme());
        //             },
        //             child: Row(children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(right: 10,),
        //                 child: Text("Near me",
        //                 style: GoogleFonts.plusJakartaSans(
        //                         fontSize: 22,
        //                         fontWeight: FontWeight.w500,
        //                         color: Colors.white,
        //                       ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 5, right: 16),
        //                 child: SvgPicture.asset("assets/icons/send.svg"),
        //               )
        //             ],),
        //           )
        //         ],
        //       ),
        //     ),
        //     leadingWidth: MediaQuery.of(context).size.width,
        //     backgroundColor: AppColors().primaryColor,
        //     bottom: PreferredSize(
        //       preferredSize: Size.fromHeight(100.0), // Set the preferred size for the input field area
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(vertical: 20), // Adjust padding as needed
        //         child: Container(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //             child: GetBuilder<Search_Controller>(
        //               init: Search_Controller(),
        //               builder: (controller){
        //                 return TextFormField(
        //                   focusNode: _focusNode,
        //                   onTap: () {
        //                     controller.showHistory();
        //                     widget.isSearch = controller.isSearch;
        //                     setState(() {});
        //                   },
        //                   style: GoogleFonts.plusJakartaSans(
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xff000000).withOpacity(0.4),
        //                     ),
        //                   initialValue: widget.searchResults,
        //                      decoration: InputDecoration(
        //                             hintText: 'Search circuits by City or landmark', // Placeholder text
        //                             hintStyle: GoogleFonts.plusJakartaSans(
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xff000000).withOpacity(0.4),
        //                     ),
        //                     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //                             suffixIcon: Padding(
        //                                padding: const EdgeInsets.symmetric(horizontal: 20),
        //                               child: SvgPicture.asset(
        //               "assets/icons/search.svg",
        //               color: Color(0xff000000).withOpacity(0.5),
        //               width: 25,
        //               height: 25,
        //             ),
        //                             ),
        //                             filled: true,
        //                             fillColor: Colors.white,
        //                             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               borderSide: BorderSide.none
        //                             )
        //                           ),
        //                     );
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
         body: Stack(
           children: [
             Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, top: 10, right: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            "Filter by route categories",
                            style: GoogleFonts.plusJakartaSans(
                                    fontSize: targetFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                          );
                          },
                        ),
                      ),
                   Padding(
                     padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                     child: Container(
                           height: 50, // Set a fixed height for the horizontal list
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                             children: [
                              CategoryCard(catImageUrl: "assets/images/top.png", category_name: "History"),
                              Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: CategoryCard(catImageUrl: "assets/images/nature.png", category_name: "Agriculture")
                               ),
                               Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: InkWell(
                        onTap: (){
                          Get.find<PageRouteController>().changePage(3);
                        },
                        child: CategoryCard(catImageUrl: "assets/images/food.png", category_name: "Food"))
                               )
                             ],
                           ),
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
                                imageUrl: "assets/images/shanghai_market.png",
                                flag_url: "assets/images/flag2.png",
                                width: 200.0,
                                height: 230.0,
                                title: "Bangkok \nCulinary Delights",
                                color: Color(0xffCACACA),
                                timings: "6 hours . 8 stops . 6.9km",
                              ),
                               CircuitCard(
                                tl_tr_br_radius: 10,
                                bl_radius: 30,
                                imageUrl: "assets/images/liverpool.png",
                                flag_url: "assets/images/flag2.png",
                                width: 200.0,
                                height: 230.0,
                                title: "Bangkok Statues",
                                color: Color(0xffCACACA),
                                timings: "3 hours . 4 stops . 4.2km",
                                                     ),
                                 CircuitCard(
                                tl_tr_br_radius: 10,
                                bl_radius: 30,
                                imageUrl: "assets/images/night_market_shanghai.png",
                                flag_url: "assets/images/flag2.png",
                                width: 200.0,
                                height: 230.0,
                                title: "Parks of Bankok",
                                color: Color(0xffCACACA),
                                timings: "3 hours . 3 stops . 7.2km",
                                                     ),
                                 CircuitCard(
                                tl_tr_br_radius: 10,
                                bl_radius: 30,
                                imageUrl: "assets/images/liverpool_1.png",
                                flag_url: "assets/images/flag2.png",
                                width: 200.0,
                                height: 230.0,
                                title: "'Hangover' movie \n locations reel",
                                color: Color(0xffCACACA),
                                timings: "4 hours . 6 stops . 5.5km",
                                                     ),
                                CircuitCard(
                                tl_tr_br_radius: 10,
                                bl_radius: 30,
                                imageUrl: "assets/images/img2.png",
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
                                imageUrl: "assets/images/img3.png",
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
        ) 
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
    //       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>HomePage(screenIndex: 0,));
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
    //       Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>FavScreen(screenIndex: 1,));
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
}