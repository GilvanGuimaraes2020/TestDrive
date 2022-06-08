import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/model/listaMarca.dart';

/* 
Cria o checkbox marca */

// ignore: must_be_immutable
class CheckBoxModel extends StatefulWidget {
  
  ListaMarca? listaMarca;
   CheckBoxModel({ Key? key,  required this.listaMarca }) : super(key: key);

  @override
  State<CheckBoxModel> createState() => _CheckBoxModelState();
}

class _CheckBoxModelState extends State<CheckBoxModel> {
  bool _localVaue = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Filtro>(
      builder: (context , filtroValue, child){
        return  Row(
          
      children: [
        Checkbox(value: _localVaue, 
        onChanged: (value){
          _localVaue = value!;
          filtroValue.atualizaMarca(widget.listaMarca!.marca, _localVaue);
        }),
        
          Image.asset("imagens/${widget.listaMarca!.pathImagem}" ,width: 24, height: 24, ),
          
        Text(widget.listaMarca!.marca),
      ],
    );
      } ,);
      }
      }
     