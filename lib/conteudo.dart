import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';




class conteudo extends StatefulWidget {
 const conteudo({super.key});




 @override
 State<conteudo> createState() => _conteudoState();
}




class _conteudoState extends State<conteudo> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFFE8E8E8),
     body: Column(
       children: [
         Container(
           height: 200,
           width: 400,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               SizedBox(
                 width: 10,
               ),
               Expanded(
                 child: Text(
                   "Conteúdos que mais caem no enem!",
                   style: GoogleFonts.montserrat(
                     fontWeight: FontWeight.bold,
                     fontSize: 26,
                   ),
                 ),
               ),
             ],
           ),
           decoration: BoxDecoration(
             color: Color(0xFF66A9CF),
           ),
         ),
         SizedBox(
           height: 8,




         ),
         Padding(padding: const EdgeInsets.all(16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [




               ElevatedButton(
                 onPressed: () {},
                 child: Text(
                   "Linguagens",
                   style: GoogleFonts.montserrat(
                       color: Colors.black,
                       fontSize: 15,
                       fontWeight: FontWeight.bold),
                 ),
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size(294, 87),
                   backgroundColor: Color(0xFFC8D9DF),
                 ),
               ),


              
               SizedBox(
                height: 16
                ,
               ),

               ElevatedButton(
                 onPressed: () {},
                 child: Text(
                   "Linguagens",
                   style: GoogleFonts.montserrat(
                       color: Colors.black,
                       fontSize: 15,
                       fontWeight: FontWeight.bold),
                 ),
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size(294, 87),
                   backgroundColor: Color(0xFFBFD6D1),


                 ),
               ),

               SizedBox(
height: 16,
               ),












             ],
           ),
         ),
       ],
     ),
   );
 }
}



