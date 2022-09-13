import 'package:flutter/material.dart';




class MensajeChat extends StatelessWidget {
  const MensajeChat({

    Key? key, 
    required this.texto, 
    required this.uid, 
    required this.ControlAnimacion
    
    }) : super(key: key);


  final String texto;
  final String uid;
  final AnimationController ControlAnimacion;

  @override
  Widget build(BuildContext context) {

    return FadeTransition(
      opacity: ControlAnimacion,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent:  ControlAnimacion, curve: Curves.easeOut),
        child: Container(
          child: uid == '123'
          ? _myMessage()
          : _notMyMessage(),
        ),
      ),
    );
    
  }

  Widget _myMessage() {

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 5,
          bottom: 5,
          left: 50
        ),
        child: Text(this.texto, style: TextStyle (color: Colors.white),),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );

  }


  Widget _notMyMessage(){

     return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 50,
          bottom: 5,
          left: 5
        ),
        child: Text(this.texto, style: TextStyle (color: Colors.black87),),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );


  }



}

