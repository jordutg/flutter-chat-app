import 'package:flutter/material.dart';



class BotonAzul extends StatelessWidget {
  const BotonAzul({
    Key? key,
    required  this.onpressed,
    required this.texto
    
    }) : super(key: key);

  final  void Function() onpressed;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      
       child: ElevatedButton(
      
            onLongPress: () {
              print('Eres gay');
            },
            onPressed: onpressed, 
            child: Container(
            //width: double.infinity,
            child: Center(
              child: Text(texto) ,
            ),
          ),
           )



    );
  }


}