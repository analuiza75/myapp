import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Database {
  static List botoes = [
    ElevatedButton(
      onPressed: () {},
      child: Text(
        "Linguagens",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(294, 87),
        backgroundColor: Color(0xFFC8D9DF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    SizedBox(
      height: 16,
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text(
        "Humanas",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(294, 87),
        backgroundColor: Color(0xFFBFD6D1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    SizedBox(
      height: 16,
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text(
        "Ciências da Natureza",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(294, 87),
        backgroundColor: Color(0xFFE8C6D2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    SizedBox(
      height: 16,
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text(
        "Matemática",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(294, 87),
        backgroundColor: Color(0xFFBFD6D1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  ];
}
