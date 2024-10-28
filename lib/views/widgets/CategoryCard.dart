import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String catImageUrl;
  final String category_name;
  const CategoryCard({super.key, required this.catImageUrl, required this.category_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF8F8F8)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 20.0, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(catImageUrl),
            SizedBox(
              width: 10,
            ),
            Text(
                      category_name,
                      style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                      softWrap: true,
                    ),
          ],
        ),
      ),
    );
  }
}