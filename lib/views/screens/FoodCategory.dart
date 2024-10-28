import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/screens/SearchPage.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/CategoryCard.dart';
import 'package:shortscircuit/views/widgets/CircuitCard.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import '../../controllers/SearchController.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key});

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> with SingleTickerProviderStateMixin{
  bool isSearch = false;
  late AnimationController _animationController;
  late Animation _animation; // Minimum padding value

@override
void initState() {
  super.initState();
 _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
}
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
        //            InkWell(
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
        //                   onTap: () {
        //                     isSearch = controller.isSearch;
        //                     setState(() {});
        //                     controller.showHistory();
        //                   },
        //                   style: GoogleFonts.plusJakartaSans(
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xff000000).withOpacity(0.4),
        //                     ),
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
         body: AnimatedBuilder(
           animation: _animationController,
           builder: (context, child) {
             return Transform.scale(
               scale: _animation.value,
               child:  Stack(
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
                        return RichText(
                               text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "The best circuits for ",
                                    style: GoogleFonts.plusJakartaSans(
                                            fontSize: targetFontSize,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                  ),
                                  TextSpan(
                                    text: "Food",
                                    style: GoogleFonts.plusJakartaSans(
                                            fontSize: targetFontSize,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                  ),
                                   TextSpan(
                                    text: " shorts",
                                    style: GoogleFonts.plusJakartaSans(
                                            fontSize: targetFontSize,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                  )
                                ]
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
                                        imageUrl: "assets/images/img7.png",
                                        flag_url: "assets/images/flag9.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Hot Dogs of \n Tokyo",
                                        color: Color(0xffCACACA),
                                        timings: "5 hours ⬩ 7 stops ⬩ 4.9km",
                                      ),
                                       CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img9.png",
                                        flag_url: "assets/images/flag10.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Argentinian Steak \nin Buenos Aires",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 4 stops ⬩ 4.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img9.png",
                                        flag_url: "assets/images/flag11.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Discovering Posh \nPrague Picks",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 4 stops ⬩ 7.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img10.png",
                                        flag_url: "assets/images/flag12.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Austin food \ntrucks story",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 8 stops ⬩ 3.5km",
                                                             ),
                                        CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img11.png",
                                        flag_url: "assets/images/flag13.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Parks of Bankok",
                                        color:Color(0xffCACACA),
                                        timings: "3 hours . 3 stops . 7.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img12.png",
                                        flag_url: "assets/images/flag14.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "'Hangover' movie \n locations reel",
                                        color: Color(0xffCACACA),
                                        timings: "4 hours . 6 stops . 5.5km",
                                                             ),
                                        CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img7.png",
                                        flag_url: "assets/images/flag9.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Hot Dogs of \n Tokyo",
                                        color: Color(0xffCACACA),
                                        timings: "5 hours ⬩ 7 stops ⬩ 4.9km",
                                      ),
                                       CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img9.png",
                                        flag_url: "assets/images/flag10.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Argentinian Steak \nin Buenos Aires",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 4 stops ⬩ 4.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img9.png",
                                        flag_url: "assets/images/flag11.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Discovering Posh \nPrague Picks",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 4 stops ⬩ 7.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img10.png",
                                        flag_url: "assets/images/flag12.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Austin food \ntrucks story",
                                        color: Color(0xffCACACA),
                                        timings: "3 hours ⬩ 8 stops ⬩ 3.5km",
                                                             ),
                                        CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img11.png",
                                        flag_url: "assets/images/flag13.png",
                                        width: 200.0,
                                        height: 230.0,
                                        title: "Parks of Bankok",
                                        color:Color(0xffCACACA),
                                        timings: "3 hours . 3 stops . 7.2km",
                                                             ),
                                         CircuitCard(
                                        tl_tr_br_radius: 10,
                                        bl_radius: 30,
                                        imageUrl: "assets/images/img12.png",
                                        flag_url: "assets/images/flag14.png",
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
                  //      AnimatedContainer(
                  //    duration: Duration(milliseconds: 500),
                  //   margin: EdgeInsets.only(bottom: isSearch ? 0 : MediaQuery.of(context).size.height,),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height,
                  //   decoration: BoxDecoration(
                  //     color: AppColors().primaryColor
                  //   ),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 0),
                  //     child: SingleChildScrollView(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             height: 200,
                  //             child: ListView(
                  //               children: [
                  //                 InkWell(
                  //                   onTap: (){
                  //                     Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Bangkok", isSearch: false,));
                  //                   },
                  //                   child: SuggestionTile(suggestionTitle: "Bangkok (City)",)
                  //                   ),
                  //                 InkWell(
                  //                   onTap: (){
                  //                     Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Baltimore", isSearch: false)
                  //                     );
                  //                   },
                  //                   child: SuggestionTile(suggestionTitle: "Baltimore (City)")),
                  //                 InkWell(
                  //                   onTap: (){
                  //                     Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Baku", isSearch: false));
                  //                   },
                  //                   child: SuggestionTile(suggestionTitle: "Baku (City)")),
                  //                 InkWell(
                  //                   onTap: (){
                  //                     Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Bartan Superdrome", isSearch: false));
                  //                   },
                  //                   child: SuggestionTile(suggestionTitle: "Bartan Superdrome (Landmark)"))
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(top: 50),
                  //             child: Text(
                  //                     "Recent Searches",
                  //                     style: GoogleFonts.plusJakartaSans(
                  //                        fontSize: 16,
                  //                        fontWeight: FontWeight.w700,
                  //                        color: Colors.white,
                  //                        decoration: TextDecoration.none
                  //                      ),
                  //                   ),
                  //           ),
                  //           //  Container(
                  //           //   height: 300,
                  //           //   child: ListView(
                  //           //     children: [
                  //           //       SuggestionTile(suggestionTitle: "Night markets of Shanghai"),
                  //           //     ],
                  //           //   ),
                  //           //              ),
                  //            Container(
                  //             width: MediaQuery.of(context).size.height,
                  //             child: SuggestionTile(suggestionTitle: "Night markets of Shanghai")),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                   ],
                 ),
             );
           }
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
}