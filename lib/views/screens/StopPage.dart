import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/ReelTile.dart';

class StopPage extends StatelessWidget {
  const StopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: AppColors().primaryColor,
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutBuilder(
                    builder: (context, constraints) {
                      double screenWidth = constraints.maxWidth;
                      double targetFontSize;
                
                      if (screenWidth <= 320) {
                      targetFontSize = 19;
                      } else if (screenWidth <= 360) {
                      targetFontSize = 21;
                      } else {
                      targetFontSize = 25;
                      }
                      return Text(
                      "1.Chinatown",
                      style: GoogleFonts.plusJakartaSans(
                              fontSize: targetFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                                      );
                    },
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double targetFontSize;
                                  
                        if (screenWidth <= 320) {
                        targetFontSize = 10;
                        } else if (screenWidth <= 360) {
                        targetFontSize = 11;
                        } else {
                        targetFontSize = 12;
                        }
                        return Container(
                          width: 150,
                          child: Text(
                          "Bangkok culinary delights",
                          style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  wordSpacing: 0.8
                                ),
                                            ),
                        );
                      },
                                    ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
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
                    ),
                                Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
    child: Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xff242424)),
  ),)
                  ],
                )
              ],
            ),
            ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05, bottom: MediaQuery.of(context).size.height * 0.03, top: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SingleChildScrollView(
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
                      targetFontSize = 14;
                        } else if (screenWidth <= 360) {
                      targetFontSize = 16;
                        } else {
                      targetFontSize = 18;
                        }
                        return Text(
                          "Tips from scene",
                          style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1C1D20),
                                ),
                        );
                        },
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double targetFontSize;
              
                        if (screenWidth <= 320) {
                      targetFontSize = 12;
                        } else if (screenWidth <= 360) {
                      targetFontSize = 14;
                        } else {
                      targetFontSize = 16;
                        }
                        return Text(
                        "Capture the bustling energy of Bangkok's Chinatown and savor the authentic street food delights.",
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.plusJakartaSans(
                                fontSize: targetFontSize,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1D20),
                              ),
                      );
                      },
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double screenWidth = constraints.maxWidth;
                        double targetFontSize;
              
                        if (screenWidth <= 320) {
                      targetFontSize = 14;
                        } else if (screenWidth <= 360) {
                      targetFontSize = 16;
                        } else {
                      targetFontSize = 18;
                        }
                        return Text(
                          "Best time to shoot",
                          style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors().primaryColor,
                                ),
                        );
                        },
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double targetFontSize;
              
                        if (screenWidth <= 320) {
                      targetFontSize = 12;
                        } else if (screenWidth <= 360) {
                      targetFontSize = 14;
                        } else {
                      targetFontSize = 16;
                        }
                        return Text(
                        "Evening (night market and vibrant \natmosphere)",
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.plusJakartaSans(
                                fontSize: targetFontSize,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1D20),
                              ),
                      );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ReelTile(reelTitle: "Hidden gem in chinatown Bangkok", videoUrl: "assets/images/liverpool.png", authorName: "travisleon1", views: "29.3K", width: 150.0, height: 200, authorAvatar: "assets/images/avatar2.jpeg",),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ReelTile(reelTitle: "a must visit restaurant in Bangkok, China Town", videoUrl: "assets/images/img5.png", authorName: "izzieprice_", views: "29.3K", width: 150.0, height: 200, authorAvatar: "assets/images/avatar2.jpeg",),
                            ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ReelTile(reelTitle: "Dont miss out on these places in China Town", videoUrl: "assets/images/img6.png", authorName: "thesamtyler", views: "29.3K", width: 150.0, height: 200, authorAvatar: "assets/images/avatar3.jpeg",),
                            )
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 200 * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/video.svg",
                                width: 30,
                                height: 30, 
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: LayoutBuilder(
                                                builder: (context, constraints) {
                                                  double screenWidth = constraints.maxWidth;
                                        double targetFontSize;
                              
                                        if (screenWidth <= 320) {
                                      targetFontSize = 12;
                                        } else if (screenWidth <= 360) {
                                      targetFontSize = 14;
                                        } else {
                                      targetFontSize = 16;
                                        }
                                        return Text(
                                                  "Camera settings",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff222222).withOpacity(0.6),
                                ),
                                                );
                                                },
                                              ),
                              ),
                              LayoutBuilder(
                                                builder: (context, constraints) {
                                                  double screenWidth = constraints.maxWidth;
                                        double targetFontSize;
                              
                                        if (screenWidth <= 320) {
                                      targetFontSize = 12;
                                        } else if (screenWidth <= 360) {
                                      targetFontSize = 14;
                                        } else {
                                      targetFontSize = 16;
                                        }
                                        return Text(
                                                  "Standard lens, medium ISO, handheld shots",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff222222).withOpacity(0.6),
                                ),
                                                );
                                                },
                                              ),
                            ],
                          ),
                        ),
                      )
                      )
                  ],
                          ),
              )),
              Align(
                  alignment: Alignment.bottomCenter,
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
                        Text("Google Maps to this location",
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
            ],
          ),
        ),
      ),
    );
  }
}