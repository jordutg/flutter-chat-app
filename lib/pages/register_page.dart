
import 'package:chat/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/etiquetas.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea (
        child: SingleChildScrollView( // para poder poner horizontal
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only( top : 50 ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                   Logo(titulo: 'Registro'),
                  
                  _Formulario(),
                  
                  Etiquetas(ruta: 'chat', textoP: '¿Ya te has registrado?',textoS: 'Ingresar ahora!',), 
                  
                  Text('Términos y condiciones de uso', style: TextStyle (fontWeight: FontWeight.w200) ),
                  
                  SizedBox( height: 1)
                  
                  
              ],
            ),
          ),
        ),
      ),
     );
  
  }
}


class _Formulario extends StatefulWidget {
  const _Formulario({Key? key}) : super(key: key);

  @override
  State<_Formulario> createState() => __EstadoFormulario();
}




class __EstadoFormulario extends State<_Formulario> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:30),
      padding: EdgeInsets.symmetric( horizontal: 50),
      child: Column(
        children:  <Widget> [

          CustomInput(
            icono: Icons.supervisor_account,
            texto: 'Nombre',
            obtenerTexto: nameCtrl,
          ),

          CustomInput(
            icono: Icons.mail_outline,
            texto: 'Correo',
            tipoTeclado: TextInputType.emailAddress,
            obtenerTexto: emailCtrl,
          ),

          CustomInput(
            icono: Icons.password,
            texto: 'Contraseña',
            obtenerTexto: passCtrl,
            esContrasena: true,
          ),
       
          BotonAzul(
            onpressed:  () {
                print(emailCtrl.text);
                print(passCtrl.text);},
            texto: 'Registrarme',
          )
        ],
      ),
    );
    
  }
}

