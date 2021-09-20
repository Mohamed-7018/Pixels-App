import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


roundedSnackBar(context, {String text}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: GoogleFonts.lilyScriptOne(
          color: Colors.white,
        ),

      ),
      backgroundColor: Colors.white.withOpacity(0.2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
          bottom: Radius.circular(15),
        ),
      ),
    ),
  );
}