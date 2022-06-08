
import 'package:flutter/material.dart';
import 'package:test_dryve/shared/messages/messages.dart';

/* 
cria o widget de campo de texto */
// ignore: must_be_immutable
class Wcampotexto extends StatelessWidget {
  final variavel;
  String? rotulo;
  final bool eSenha;
  final Icon? icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onchange;

  Wcampotexto({Key? key, this.variavel, this.rotulo, required this.eSenha, this.icon, this.validator, this.onchange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: variavel,
        style: const TextStyle(fontSize: 24),
        obscureText: eSenha,
        onChanged:onchange,

        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: const TextStyle(fontSize: 16),
          hintText:Messages().informeMessage("informacao"),
          hintStyle: const TextStyle(fontSize: 16),
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //validar a entrada de dados
        validator: validator
      ),
    );
  }
}
