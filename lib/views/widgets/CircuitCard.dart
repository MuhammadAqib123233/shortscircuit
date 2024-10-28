import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CircuitCard extends StatelessWidget {
  final double tl_tr_br_radius;
  final double bl_radius;
  final String imageUrl;
  final String flag_url;
  final double width;
  final double height;
  final String title;
  final String timings;
  final color;
  const CircuitCard({super.key, required this.tl_tr_br_radius, required this.bl_radius, required this.imageUrl, required this.flag_url, required this.width, required this.height, required this.title, required this.color, required this.timings});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(tl_tr_br_radius), topRight: Radius.circular(tl_tr_br_radius), bottomRight: Radius.circular(tl_tr_br_radius), bottomLeft: Radius.circular(bl_radius))
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(flag_url, width: 40,),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Center(
                        child: SvgPicture.asset("assets/icons/heart.svg", width: 15, color: color,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(tl_tr_br_radius), bottomLeft: Radius.circular(bl_radius))
              ),
              child:  Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                child: timings == "" ? LayoutBuilder(
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
                            title,
                            style: GoogleFonts.plusJakartaSans(
                                    fontSize: targetFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          );
                      }, 
                    ) : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LayoutBuilder(
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
                            title,
                            style: GoogleFonts.plusJakartaSans(
                                    fontSize: targetFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          );
                      }, 
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                           double screenWidth = constraints.maxWidth;
      double targetFontSize;

      if (screenWidth <= 320) {
        targetFontSize = 10;
      } else if (screenWidth <= 360) {
        targetFontSize = 10;
      } else {
        targetFontSize = 12;
      }
      return Text(
                              timings,
                              style: GoogleFonts.plusJakartaSans(
                                      fontSize: targetFontSize,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                              textAlign: TextAlign.right,
                              softWrap: true,
                            );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}