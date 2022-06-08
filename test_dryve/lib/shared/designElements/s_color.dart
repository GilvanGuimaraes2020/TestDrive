
import 'package:flutter/material.dart';

/* 
classe utilizada para manutenção no APP alterando ela para mudar nas demais telas */

class Scolor{

   

  Color returnColor(String element){

    switch (element) {
      case ("button"):
        return Colors.blue;
      case ("border"):
        return Colors.black;

      case ("icon"):
        return Colors.blue;
      
      case ("Preto"):
        return Colors.black;
      
      case ("Vermelho"):
        return Colors.red;
      
      case ("Prata"):
        return Colors.grey;

      case ("Favorite"):
        return Colors.white; 

      case ("Realce"):
        return Colors.blueAccent;      

      case ("Branco"):
        return const Color.fromARGB(153, 249, 244, 244);  

      default:
        return Colors.blue;
    }
    
  }
  
}