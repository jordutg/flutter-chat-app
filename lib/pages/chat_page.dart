import 'dart:ffi';
import 'dart:io';

import 'package:chat/widgets/mensaje_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{ //para poder trabajar con animaciones 


  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  
  List <MensajeChat> _messages = [




  ];



  bool _estaEscribiendo = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle (fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius:  14,
            ),
            SizedBox(height: 3),
            Text('Jordi Utgés', style:  TextStyle( color: Colors.black87),)
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        child: Column (
          children: [
            Flexible( 
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_,i) => _messages[i],
                reverse: true,)
             ),
             Divider(height: 1,),

             Container(
              color: Colors.white,
              child: _inputChat(),
             )

        ]),
      ),
     );
  
  }

  Widget _inputChat(){
   
     return SafeArea(
      child: Container( //me gusta agregar el container para poder añadir paddins y margenes
        margin: EdgeInsets.symmetric( horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController ,
                onSubmitted: _handleSumit, //lo que se escribe en el texto
                onChanged: ( texto) {  // para que cuando este vacio no pueda enviar un mensaje
                        setState(() {
                      if (texto.trim().length > 0) {
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false ;
                      }
                   });

                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'),
                  focusNode: _focusNode,
                  ),
            ),
            //Boton de enviar

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS   //para apple
                 ? CupertinoButton(
                  child: Text('Enviar'), 
                  onPressed:_estaEscribiendo
                      ? () => _handleSumit(_textController.text.trim())
                      : null) 

                 : Container( //para IOS
                  margin: EdgeInsets.symmetric( horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData (color : Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon (Icons.send),
                      onPressed:_estaEscribiendo
                      ? () => _handleSumit(_textController.text.trim())
                      : null
                  ),

                 ) ,
              
              
              
              ),
             ) 
          ],
        ),   

       

      
      )
      
      
      );
     



  }

  _handleSumit (String texto) { //LO QUE ESCRIBIMOS POR TECLADO
  


  if (texto.length == 0) return; // si no hay texto no hacer nada

    print(texto);
     _textController.clear(); //para que se limpie el texto al enviar el mensaje
    _focusNode.requestFocus(); //para que el teclado no baje al enviar el mensaje

    final nuevoMensaje = new MensajeChat(
      texto: texto, 
      uid: '123', 
      ControlAnimacion: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),);

    _messages.insert(0, nuevoMensaje); //para poner en la posicion 0 el nuevo mensaje

    nuevoMensaje.ControlAnimacion.forward(); // para que empieze la animacion



    setState(() {
      _estaEscribiendo=false;
    });
   
  }


// cuando cerremos la pantalla del chat se va a ejecutar esta funcion y va a a limpiar cada uno de los controles de animacion
  @override
  void dispose() {
    // TODO: off socket
 
    for( MensajeChat message in _messages){
      message.ControlAnimacion.dispose();
    }

    super.dispose();
  }
}