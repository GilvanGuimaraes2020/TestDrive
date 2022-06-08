
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_dryve/control/carrosRepository.dart';
import 'package:test_dryve/model/carros.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/templates/homepage_drawer.dart';
import 'package:test_dryve/templates/listsCards.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
var scaffoldKey = GlobalKey<ScaffoldState>();
int zero = 0;

List<Carros> carros = [];


Future<List<Carros>?> consulta(bool isFilter, bool favoritaCarro , List<String>? marca, List<String>? cor, String? nome, int quantidade, List<String?> idFavorite)async{
  /*Verifica quais fitros executar, e passa como paramentro as listas
  acessando o carrosRepository na funçao que compete  */
  if (isFilter){
    
    if (nome == "" && (quantidade == 0 || quantidade == null)){
      return consulta(false, false, marca, cor, nome, quantidade, []);

    }
          return await CarrosRepository().consultaCarroFilter(cor, marca, nome);

    
  } else if(favoritaCarro){
    return await CarrosRepository().favoritaCarro(idFavorite);
  }
  else {
    return await CarrosRepository().consultaCarro();
  }

  
 
}


  @override
  Widget build(BuildContext context) {  

   
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: 
          const CircleAvatar(
            backgroundImage:ExactAssetImage("imagens/VOLKSWAGEN.jpg", scale: 2,) ,
            ),
          
         backgroundColor: Colors.white,
        title: const Text("VW Seminovos" , style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
        actions:  [
         Padding(
           padding: const EdgeInsets.all(5.0),
           child: Consumer<Filtro>(
             builder: (context, filtroValue, child) {
             return Stack(
               children: [
                 IconButton(
               onPressed: () {
                  if(filtroValue.quantidade > 0){
                    filtroValue.limpaFiltros();
                  }
                 scaffoldKey.currentState?.openDrawer();
                 } ,
               icon:  const Icon(Icons.filter_list, size: 50, color: Colors.black,)),

               filtroValue.quantidade > 0 ? Positioned(
                 right: 0,
                 top: 0,
                  child:  ClipOval(                    
                    child: Container(
                      color: Colors.blue,
                      child: Text("${filtroValue.quantidade}", style: const TextStyle(fontSize: 12)))),
                  ) : Positioned(child: Container())

               ],
             );
           },),
         ),
         const SizedBox(
           width: 10,
         )
        ],

      ),
      body: Consumer<Filtro>(builder: (context, value, child) {
        return FutureBuilder(
        future: consulta(value.isFilter, value.favoriteCar, value.marca, value.corId, value.nome, value.quantidade, value.idFavorite),
        builder: (context , AsyncSnapshot<List<Carros>?> future){
          if (future.hasData){
           
            return Column(
        children: [
          ListCards(carros: future.data!,),
        ]  );
          } else{
           
            return const CircularProgressIndicator()  ;
          }
      });
  }),
           
      
      
     
     
      drawer:const Drawer(        
        child: DrawerHomePage(),
        ) ,
      
    );
  }
}