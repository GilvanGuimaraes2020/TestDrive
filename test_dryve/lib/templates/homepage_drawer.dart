import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dryve/control/listasIntegracao.dart';
import 'package:test_dryve/model/filtro.dart';
import 'package:test_dryve/model/listaCor.dart';
import 'package:test_dryve/model/listaMarca.dart';
import 'package:test_dryve/shared/messages/messages.dart';
import 'package:test_dryve/shared/widgetsComum/w_textField.dart';
import 'package:test_dryve/templates/widgets/checkBoxModel.dart';
import 'package:test_dryve/templates/widgets/checkBoxCores.dart';
/* 
componente com a funçao de gerar um drawer para aplicaçao dos filtros */
class DrawerHomePage extends StatefulWidget {
  const DrawerHomePage({ Key? key }) : super(key: key);

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
String valueRadio = "Branco";
  var keyCheck = [GlobalKey(), GlobalKey()] ;
  var txtNome = TextEditingController();
  
 
/* Busca lista das marcas atraves uma requisao http */
Future<List<ListaMarca>?> carros() async{

  return await ListaIntegracao().consultaMarca();
}
/* busca lista das cores atraves uma requisiçao http  */ 
Future<List<ListaCor>?> cores() async{

  return await ListaIntegracao().consultaCor();

}

/* cria uma lista com as listas de marcas e cores para 
entrega-las ao future builder */
Future<List>listFuture() async{

  return [await cores() , await carros()];
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:const Text("Filtrar", style: TextStyle(color: Colors.black),),
        leading: Consumer<Filtro>(
          builder: (context, filtroValue, child) {
          return IconButton(
          onPressed: (){
            //limpa os filtros utilizando o provider
            filtroValue.limpaFiltros(); 
            Navigator.of(context).pop();

          }, icon: const Icon(Icons.keyboard_arrow_down , color: Colors.black,),);
        },) 
    ),
    body:FutureBuilder(
      future: listFuture(),
      builder: (context , AsyncSnapshot<List> lista){
        
        if (lista.hasData){
            /* atribui às variveis cores e carros o retorno
            de listaFutura com os conteudos das requisiçoes http*/
          List<ListaCor?> cores = lista.data![0];
        List<ListaMarca?> carros = lista.data![1];
          return SingleChildScrollView(
        padding:const EdgeInsets.all(8),
        child: Column(
          
          children: [
            Wcampotexto(
              icon: const Icon(Icons.search),
              eSenha: false,
              variavel: txtNome,
              //utiliza classe de messages para os campos de texto que forem para pesquisa
              rotulo: Messages().informeMessage('pesquisa'),),
      
              const Divider(),
      
              Column(
                children:  List.generate(
                  /* criar os checkbox com as marcas */
                  carros.length, (i) => CheckBoxModel(listaMarca: carros[i])  ),
              ),
    
              const Divider(),
    
              const Text("Cor" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
    
             GridView.count(crossAxisCount: 2,
             shrinkWrap: true,
             children: List.generate(
               /* cria os checkbox com as cores e seus IDS */
               cores.length, (i) => CheckBoxCores(listaCor: cores[i] ))
             
             )
                
    
              
                    
          ],
        ),
      );
        } else{
          return const CircularProgressIndicator();
        }
        
      },
      
    ),
    
    persistentFooterButtons: [
      /* Botão para limpar filtros */
      Consumer<Filtro>(
        builder: (context, filtroValue, child) {
        return ElevatedButton(

        onPressed: (){
           filtroValue.limpaFiltros();
            Navigator.of(context).pop();
        }, 
        child: const Text("Limpar"));
      },),

      /* Botão para executar o filtro */
      Consumer<Filtro>(
        builder: (context, filtroValue, child) {
        return ElevatedButton(

        onPressed: (){
           filtroValue.filtrarElementos(true , txtNome.text);
           Navigator.of(context).pop();
        }, 
        child:const Text("Filtrar"));
      },),
    ],
    
    );
  }
}