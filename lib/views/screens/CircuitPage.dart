import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/StopPage.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/AppBar.dart';

class CircuitPage extends StatelessWidget {
  final String title;
  final String imageUrl; 
  const CircuitPage({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05, top: MediaQuery.of(context).size.height * 0.070, bottom: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child:Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
    child: Icon(Icons.arrow_back_ios, size: 15, color: Color(0xff242424)),
  ),)
                              ),
                               Container(
      child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.white.withOpacity(0.1), // Adjust opacity as needed
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Shingai",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Bangkok",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF1AFFFFFF), // Background color with opacity
      ),
    ),
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff141034).withOpacity(0.17),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                         Text("6 scenes",
                                                    style: GoogleFonts.plusJakartaSans(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w700,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Row(
                                              children: [
                                                Text("see examples",
                                                      style: GoogleFonts.plusJakartaSans(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w700,
                                                              color: Colors.white,
                                                            ),
                                                      ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: SvgPicture.asset(
                                                    "assets/icons/external_link.svg"
                                                  ),
                                                )                                        
                                                ],
                                            ),
                                          )
                                    ]),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Center(
                                    child: SvgPicture.asset("assets/icons/heart.svg", width: 25, color: Color(0xffBDB9E4),),
                                  ),
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(title,
                                                    style: GoogleFonts.plusJakartaSans(
                                                            fontSize: 22,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color(0xff242424),
                                                          ),
                                                    ), 
                  ),
                  Text("Experience the unique flavors of New York City at night, with a focus on quirky and historic food locations.",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff222222 ).withOpacity(0.7),
                                                        ),
                                                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/duration.svg", width: 50,),
                              SizedBox(
                                height: 5,
                              ),
                               Text("Difficulty",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff222222 ).withOpacity(0.7),
                                                        ),
                                                  ),
                               SizedBox(
                                height: 5,
                              ),
                               Text("Moderate",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: Color(0xff222222 )..withOpacity(0.7),
                                                        ),
                                                  ),
                          ]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/clock.svg", width: 50,),
                              SizedBox(
                                height: 5,
                              ),
                               Text("Duration",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff222222 )..withOpacity(0.7),
                                                        ),
                                                  ),
                               SizedBox(
                                height: 5,
                              ),
                               Text("2 hours",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: Color(0xff222222 ),
                                                        ),
                                                  ),
                          ]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/map.svg", width: 50,),
                              SizedBox(
                                height: 5,
                              ),
                               Text("Total Distance",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff222222 ).withOpacity(0.7),
                                                        ),
                                                  ),
                               SizedBox(
                                height: 5,
                              ),
                               Text("7.2km",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: Color(0xff222222 ).withOpacity(0.7),
                                                        ),
                                                  ),
                          ]),
                        )
                      ],
                    ),
                    ),
                    Text(
                      "Circuit preview",
                       style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w700,
                                                          color: Color(0xff4a36ec)
                                                        ),
                       textAlign: TextAlign.left,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:   Text(
      "1. Katz's Delicatessen",
      style:  GoogleFonts.plusJakartaSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xff222222)
                                                        ),
      textAlign: TextAlign.left,
      ),
    ),
    Text(
    "Capture the bustling atmosphere of Katz's Delicatessen, a historic Jewish deli known for its pastrami sandwiches.",
    style: GoogleFonts.plusJakartaSans(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff222222)
                                                      ),
    textAlign: TextAlign.left,
    ),
    
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:   Text(
      "2. Tha Maharaj",
      style:  GoogleFonts.plusJakartaSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xff2424244D)
                                                        ),
      textAlign: TextAlign.left,
      ),
    ),
    Text(
    "Photograph the scenic views of Chao Phraya River and enjoy riverside dining at Tha Maharaj.",
    style: GoogleFonts.plusJakartaSans(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff222222).withOpacity(0.3)
                                                      ),
    textAlign: TextAlign.left,
    ),
                  ],),
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>StopPage());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors().primaryColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Go to first stop",
                                                  style: GoogleFonts.plusJakartaSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white,
                                                          textBaseline: TextBaseline.alphabetic
                                                        )
                            ),
                           Padding(
                            padding: const EdgeInsets.only(left: 10, top: 2),
                            child: Icon(Icons.arrow_forward, color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}