import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/views/utills/Colors.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{
  const appbar({super.key, required this.width});
  final double width;
  @override
  Size get preferredSize => Size.fromHeight(100.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text("Near Me",
                  style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ),
                SvgPicture.asset("assets/icons/send.svg")
              ],)
            ],
          ),
        ),
        leadingWidth: width,
        backgroundColor: AppColors().primaryColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the preferred size for the input field area
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:8.0, vertical: 20), // Adjust padding as needed
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                       decoration: InputDecoration(
              hintText: 'Enter a City, landmark or keyword', // Placeholder text
              hintStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xff000000).withOpacity(0.5),
                size: 32,
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
            ),
          ),
        ),
      );
  }
  
}