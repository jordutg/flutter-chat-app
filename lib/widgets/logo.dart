import 'package:flutter/material.dart';



class Logo extends StatelessWidget { //_Logo
  const Logo({
    super.key,
    required this.titulo
    
    });

   final String titulo;


  @override
  Widget build(BuildContext context) {
    return Center( //para que todo este centrado
      child: Container( //con el container puedes agregar padding, margen..
        width: 170, //para que todo el container sea mas pequeño
        child: Column(
          children:  <Widget>[

          Image ( image: AssetImage('assets/tag-logo.png')),//para coger la imagen que hemos puesto en el asset
          SizedBox( height: 20),
          Text(titulo, style: TextStyle(fontSize:30) )

        ])  ,


      ),
    );
  }
}

