import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionTile extends StatelessWidget {
  final String suggestionTitle;
  SuggestionTile({super.key, required this.suggestionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff3D2BD1),
            width: 1
          )
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          suggestionTitle,
          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: TextDecoration.none
                          ),
        ),
      ),
    );
  }
}