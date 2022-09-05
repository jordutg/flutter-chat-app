

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key, 
    required this.icono,
    required this.texto, 
    required this.obtenerTexto, 
     this.tipoTeclado = TextInputType.text, 
     this.esContrasena = false,
    }) : super(key: key);

  final IconData icono; // icon
  final String   texto; //placeholder
  final TextEditingController obtenerTexto; //textController
  final TextInputType tipoTeclado; //keyboardType
  final esContrasena ; //isPassword

  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.only(right:20),
            margin: EdgeInsets.only(bottom:20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), //redondear
              boxShadow: [   //PARA PONER SOMBRA
                BoxShadow(
                  color:  Colors.black.withOpacity(0.05), //color sombra
                  offset: Offset (0,5), //mover sombra
                  blurRadius: 5, //difuminado
                )
              ]
                        ),
            child: TextField(  //todo lo relacionado con el texto
              controller: obtenerTexto,
              autocorrect: false,
              keyboardType: tipoTeclado, //para ver el @ en el teclado
              obscureText: esContrasena, //para que se vea lo que escribimos
              decoration: InputDecoration(
                prefixIcon: Icon (icono), // icono de email
                focusedBorder: InputBorder.none,
                border:  InputBorder.none,
                hintText: texto

              ),
            ),
          );
    
  }
}