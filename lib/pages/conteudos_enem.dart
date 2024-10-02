import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConteudosEnem extends StatefulWidget{
  
 const ConteudosEnem({super.key});




 @override
 State<ConteudosEnem> createState() => _ConteudoEnemState();
}


class _ConteudoEnemState extends State<ConteudosEnem> {
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




              















             ],
           ),
         ),
       ],
     ),
   );
 }
}
