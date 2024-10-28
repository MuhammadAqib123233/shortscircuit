import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReelTile extends StatelessWidget {
  final String reelTitle;
  final String videoUrl;
  final String authorName;
  final String views;
  final double width;
  final double height;
  final String authorAvatar;
  const ReelTile({super.key, required this.reelTitle, required this.videoUrl, required this.authorName, required this.views, required this.width, required this.height, required this.authorAvatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.7,
            child: Image.asset(videoUrl, height: 100, fit: BoxFit.cover,)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                                                reelTitle,
                                                maxLines: 3,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.plusJakartaSans(
                                fontSize: targetFontSize,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff222222)  ,
                              ),
                                              );
                                              },
                                            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(authorAvatar),
                    radius: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: LayoutBuilder(
                                                builder: (context, constraints) {
                                                  double screenWidth = constraints.maxWidth;
                                        double targetFontSize;
                              
                                        if (screenWidth <= 320) {
                                    targetFontSize = 8;
                                      } else if (screenWidth <= 360) {
                                    targetFontSize = 8;
                                      } else {
                                    targetFontSize = 8;
                                      }
                                        return Text(
                                                  authorName,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.plusJakartaSans(
                                  fontSize: targetFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222)  ,
                                ),
                                                );
                                                },
                                              ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_outlined),
                   LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth = constraints.maxWidth;
                                      double targetFontSize;
                            
                                       if (screenWidth <= 320) {
                                    targetFontSize = 8;
                                      } else if (screenWidth <= 360) {
                                    targetFontSize = 8;
                                      } else {
                                    targetFontSize = 8;
                                      }
                                      return Text(
                                                views,
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.plusJakartaSans(
                                fontSize: targetFontSize,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff222222)  ,
                              ),
                                              );
                                              },
                                            ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}