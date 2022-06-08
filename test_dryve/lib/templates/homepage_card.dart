

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_dryve/model/carros.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/shared/designElements/s_color.dart';


/* 
Cria os Cards mostrados na tela homepage */

// ignore: must_be_immutable
class HomePageCard extends StatelessWidget {
  Carros? carro;
  HomePageCard({ Key? key, this.carro }) : super(key: key);

 var f = NumberFormat("##.###"); //formatar texto para 3 digitos ex 10.000
  @override
  Widget build(BuildContext context) {
    return InkWell(
borderRadius:const BorderRadius.all(Radius.circular(10)),
     
      child:Container(
        padding:const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [                
                Container(
                  decoration: const BoxDecoration(
                    borderRadius:BorderRadius.all(
                      Radius.circular(10)
                    )
        
                  ),
                  child: ClipRRect(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(carro?.url??"https://br.freepik.com/fotos-vetores-gratis/error-not-found", //nao encontrando imagem em carro.url mostra outra imagem
                    scale: 2,
                    ),
                  ),
                ),         
               Positioned(
                right: 5,
                top: 5,
                child: Consumer<Filtro>(builder: (context, value, child) {
                  return IconButton(
                  onPressed: (){
                    value.favoritaCarro(carro?.id);
                    
                }, 
                icon:carro!.favorite !=true ?  
                const Icon(Icons.favorite , color: Color.fromARGB(96, 253, 229, 229),):
                Icon(Icons.favorite , color: Scolor().returnColor("white"),));
                },)
                  
                )
              ],
            ),
            Flex(
              direction: Axis.vertical,
              children: [
              Row(           
                mainAxisAlignment: MainAxisAlignment.center,    
              children: [ 
                Text("${carro?.brandName}", style:const TextStyle(
                  fontWeight: FontWeight.bold,),),
                  const SizedBox(width: 10,),
                  Text("${carro?.modelName}", style: TextStyle(color: Scolor().returnColor("Realce")),)] 
            ),
            Text("${carro?.modelYear} | ${carro?.fuelType}"),
            Text("${carro?.transmissionType} | ${f.format(carro?.mileage)} km"),
            Text("R\$ ${carro?.price}")
              ],)
           
            
          ],
        ),
      )
    ) ;
  }
}