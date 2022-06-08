import 'package:flutter/material.dart';
import 'package:test_dryve/shared/designElements/s_color.dart';

/* 
Gera um widget botão  */

// ignore: must_be_immutable
class WBotao extends StatelessWidget {
  String rotulo  = '';

  WBotao(this.rotulo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height/12,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color:Scolor().returnColor("border"),
        borderRadius: const BorderRadius.all(
            Radius.circular(8)
        ),
        boxShadow: [
          BoxShadow(            
            color:Scolor().returnColor("button") ,
            blurRadius: 4,
            offset: const Offset(2, 6), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(rotulo, style: const TextStyle(
          fontSize: 18,
          color: Colors.white)),
      ),
    );
  }
}
