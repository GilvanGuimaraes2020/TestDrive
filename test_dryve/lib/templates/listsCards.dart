import 'package:flutter/material.dart';
import 'package:test_dryve/templates/homepage_card.dart';

import '../model/carros.dart';

// ignore: must_be_immutable
class ListCards extends StatelessWidget {
  List<Carros>? carros;
  ListCards({ Key? key, this.carros }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      
      flex: 1,
      child: GridView.count(
       
        padding: const EdgeInsets.all(5),
        
        crossAxisCount: MediaQuery.of(context).size.width>800 ? 3
        : MediaQuery.of(context).size.width<200?1:2,
        children: List.generate(carros!.length, (i) {
          return HomePageCard(carro: carros![i],);
        }),
      ),
    );
  }
}