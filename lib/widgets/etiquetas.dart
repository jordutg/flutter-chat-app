
import 'package:flutter/material.dart';




  class Etiquetas extends StatelessWidget {


  const Etiquetas({
    Key? key,
    required  this.ruta,
    required this.textoP,
    required this.textoS
    
   
  
  }) : super(key: key);
   

   final String ruta;
   final String textoP;
   final String textoS;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:  [
          Text(textoP,style:TextStyle(  color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          SizedBox (height: 10),
          GestureDetector  ( //para que un texto sea clicable
             child: Text(textoS, style: TextStyle( color: Colors.blue[600], fontSize: 18, fontWeight:FontWeight.bold ) ),
             onTap: (){
                 Navigator.pushReplacementNamed(context, ruta); //para que se vaya a la pantalla 'Register'

             }

          )
      ],
      ),
    );
    
  }
}