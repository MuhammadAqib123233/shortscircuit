import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/controllers/PageRouteController.dart';
import 'package:shortscircuit/views/screens/CircuitPage.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/FoodCategory.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/screens/SearchPage.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/CategoryCard.dart';
import 'package:shortscircuit/views/widgets/CircuitCard.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import '../../controllers/SearchController.dart';

class HomePage extends StatefulWidget {
  final int screenIndex;
  const HomePage({super.key, required this.screenIndex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  bool isSearch = false;
  bool isSearchvisible = false;
  double _opacity = 0.0;
  ScrollController _scrollController = ScrollController();
   double _currentPadding = 20.0; // Initial padding value
  double _maxPadding = 20.0; // Maximum padding value
  double _minPadding = 0.0;
  late AnimationController _animationController;
  late Animation _animation; // Minimum padding value

@override
void initState() {
  super.initState();
  _scrollController.addListener(_onScroll);
 _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
}
void _onScroll() {
    // Get the scroll offset of the ListView
    // Get the scroll offset of the ListView
  
  if (_scrollController.position.pixels > 0) {
      setState(() {
        _currentPadding = 0;
      });
    }else{
        double offset = _scrollController.offset;
  double maxOffset = _scrollController.position.maxScrollExtent;

  double newPadding = _maxPadding - (offset * (_maxPadding / maxOffset));
  newPadding = newPadding.clamp(0.0, _maxPadding);

  setState(() {
    _currentPadding = newPadding;
  });

  if (_scrollController.position.pixels == _scrollController.position.minScrollExtent) {
    setState(() {
      _currentPadding = _maxPadding;
    });
  }
    } 
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  bool isScrollingLeft = false;
  @override
  Widget build(BuildContext context) {
    double xPadding = MediaQuery.of(context).size.width * 0.05;
     //initialPadding = MediaQuery.of(context).size.width * 0.05;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Scaffold(
        resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: MediaQuery.of(context).size.width * 0.05),
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
                     "Choose from trending circuits",
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
                padding: EdgeInsets.only(left: _currentPadding, top: 0, right: 0),
                child: Container(
                        height: 175, // Set a fixed height for the horizontal list
                        child: ListView(
                          padding: EdgeInsets.all(0),
                         controller: _scrollController,
                         shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                             onTap: () {
                               Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>CircuitPage(title: "Night markets of Shingai", imageUrl: "assets/images/img.png"), );
                             },
                              child: CircuitCard(
                                                tl_tr_br_radius: 10,
                                                bl_radius: 30,
                                                imageUrl: "assets/images/img.png",
                                                flag_url: "assets/images/flag.png",
                                                width: 160.0,
                                                height: 175.0,
                                                title: "Night markets of Shingai",
                                                color: AppColors().primaryColor,
                                                timings: "",
                                              ),
                            ),
                   InkWell(
                     onTap: () {
                               Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>CircuitPage(title: "Liverpool", imageUrl: "assets/images/liverpool_2.png"),);
                             },
                     child: Padding(
                     padding: const EdgeInsets.only(left:10),
                     child: CircuitCard(
                       tl_tr_br_radius: 10,
                       bl_radius: 30,
                       imageUrl: "assets/images/liverpool_2.png",
                       flag_url: "assets/images/flag3.png",
                       width: 160.0,
                       height: 150.0,
                       title: "Liverpool",
                       color: Color(0xffCACACA),
                       timings: "",
                     ),
                                   ),
                   ),
                 Padding(
                   padding: const EdgeInsets.only(left:10),
                   child: CircuitCard(
                     tl_tr_br_radius: 10,
                     bl_radius: 30,
                     imageUrl: "assets/images/img5.png",
                     flag_url: "assets/images/flag4.png",
                     width: 175.0,
                     height: 150.0,
                     title: "Liverpool",
                     color: Color(0xffCACACA),
                     timings: "",
                   ),
                 )
                          ],
                        ),
                      ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
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
         return Padding(
           padding: EdgeInsets.only(right: xPadding, left: xPadding),
           child: Text(
                       "Inspiration from reel types",
                       style: GoogleFonts.plusJakartaSans(
                               fontSize: targetFontSize,
                               fontWeight: FontWeight.w500,
                               color: Colors.black,
                             ),
                     ),
         );
                   },
                 ),
               ),
                Padding(
                  padding: EdgeInsets.only(left: xPadding),
                  child: Container(
                        height: 50, // Set a fixed height for the horizontal list
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                           CategoryCard(catImageUrl: "assets/images/nature.png", category_name: "Nature picks"),
                           Padding(
                   padding: const EdgeInsets.only(left:10),
                   child: InkWell(
                     onTap: (){
                      //  Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>FoodCategory(),);
                      Get.find<PageRouteController>().changePage(3);
                     },
                     child: CategoryCard(catImageUrl: "assets/images/food.png", category_name: "Food"))
                                  ),
                          ],
                        ),
                      ),
                ),
                Padding(
                 padding: EdgeInsets.only(top: 30.0, bottom: 10.0, left: xPadding),
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
                     "Or create from one-off circuit",
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
                 padding: EdgeInsets.only(right: xPadding, left: xPadding),
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Color(0xffF8F8F8),
                   ),
                   child: Padding(
                     padding: EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 40),
                     child: RichText(
                       maxLines: 3,
                       textAlign: TextAlign.left,
                     text: TextSpan(
                       style: TextStyle(fontSize: 16, color: Colors.black),
                       children: <TextSpan>[
                         TextSpan(
                           text: '...for ',
                          style: GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               color: Colors.black,
                             ),
                         ),
                         TextSpan(
                           text: 'Bangkok ',
                           style: GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               color: AppColors().primaryColor,
                             ),
                         ),
                         TextSpan(
                           text: 'that I can do in ',
                           style:  GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               color: Colors.black,
                             ),
                         ),
                         TextSpan(
                           text: '2 hours',
                           style: GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               color: AppColors().primaryColor,
                             ),
                         ),
                         TextSpan(
                           text: ", that's ",
                           style:  GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               color: Colors.black,
                             ),
                         ),
                         TextSpan(
                           text: "most walkable",
                           style:  GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               color: AppColors().primaryColor,
                             ),
                         ),
                         TextSpan(text: ". I'll record at night and I'd like to focus on ",
                         style:  GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               color: Colors.black,
                             ),
                         ),
                         TextSpan(text: "food.",
                         style:  GoogleFonts.plusJakartaSans(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               color: AppColors().primaryColor,
                             ),
                         ),
                       ],
                     ),
                   ),
                   ),
                 ),
               ),
             ],
           ),
         ), 
        ],
      ),
        ),
          );
        },
      )
    );
  }
}