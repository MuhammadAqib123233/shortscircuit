import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/PageRouter.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/FadingScreenTransition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width =  MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors().primaryColor,
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: Stack(
              children: [
                Container(
                   width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
                  child: Image.asset("assets/images/bg_logo.png",fit: BoxFit.cover)
                  ),
                Container(
                   color: Colors.transparent,
                   width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width,
                           color: Colors.transparent,
                          child: Center(
                            child:  Image.asset("assets/images/logo_2.png", width: 150, height: 150,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                              "shorts",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                          ),
                           Text(
                              "circuit",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffE0E0E0)
                              ),
                          ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                          "Mapping epic routes around cities for short-form travel content creators.",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffE0E0E0),
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: TextFormField(
                           decoration: InputDecoration(
                  hintText: 'Enter a City, landmark or keyword', // Placeholder text
                  hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000).withOpacity(0.4),
                          ),
                  
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: Color(0xff000000).withOpacity(0.5),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  )
                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: InkWell(
                            onTap: (){
                              // Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>HomePage(),);
                              Get.to(()=>PageRouter());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("Or go to the browser screen",
                                  style: GoogleFonts.plusJakartaSans(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white
                                                      ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ),
                        
                      ],
                    ),
                  )
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}