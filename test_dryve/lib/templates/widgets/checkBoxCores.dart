import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/model/listaCor.dart';
import 'package:test_dryve/shared/designElements/s_color.dart';

/* cria os checkbox com as cores entregue pela requisiçao http */
// ignore: must_be_immutable
class CheckBoxCores extends StatefulWidget {
  ListaCor? listaCor;
  
  CheckBoxCores({ Key? key , required this.listaCor}) : super(key: key);

  @override
  State<CheckBoxCores> createState() => _CheckBoxCoresState();
}

class _CheckBoxCoresState extends State<CheckBoxCores> {
  String groupValue = "Branco";
  bool checked = false;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Filtro>(
      builder: (context, filtroValue, child) {
      return Row(
      children:[
      
          Checkbox(
            value: checked,
            side: BorderSide(color: Scolor().returnColor("border")) ,
            fillColor: MaterialStateProperty.resolveWith<Color>((states){
              if(states.contains(MaterialState.disabled)){
                return Colors.transparent;
              } else{
                return Scolor().returnColor(widget.listaCor!.cor);
              }
            }),
            shape: CircleBorder(side: BorderSide(color: Scolor().returnColor("border"))),

            onChanged: (value){
              
                checked = value!;
                filtroValue.atualizaCor(widget.listaCor!.colorid , checked);
             
            }),
          Text(widget.listaCor!.cor)
      ] ,);
    },
    );
  }
}