import 'package:test_dryve/model/listaCor.dart';
import 'package:test_dryve/model/listaMarca.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/* gera listas das cores e marcas */
class ListaIntegracao{
List<ListaCor> listaCor = [];
List<ListaMarca> listaMarca = [];

Future<List<ListaCor>?> consultaCor() async{
  
    try{
      var url = Uri.parse("https://run.mocky.io/v3/ac466e17-58a4-432b-8647-7a2e4c4074e2") ;

      //Requisição HTTP
      var resp = await http.get(url);

      if (resp.statusCode == 200){
       
      List request = json.decode(resp.body.toString());

      /* trata o request convertendo para lista com objeto cores
      atraves do metodo fromJson */ 
       for (var element in request) {
        listaCor.add(ListaCor.fromJson(element))  ;
        
       }
       
       
      }
      return listaCor;
    }catch(e){
      
      print(e);
    }

  

  }

  
Future<List<ListaMarca>?> consultaMarca( ) async{
  
    try{
      var url = Uri.parse("https://run.mocky.io/v3/4f858a89-17b2-4e9c-82e0-5cdce6e90d29") ;

      //Requisição HTTP
      var resp = await http.get(url);

      if (resp.statusCode == 200){
       
                 
      List request = json.decode(resp.body.toString());

       for (var element in request) { 
        
      /* trata o request criando lista de objeto marca
      atraves do metodo fromjson */     
           listaMarca.add(ListaMarca.fromJson(element))  ;
        
         
       }
       
        
      }

   
      return listaMarca;


    }catch(e){
      
      print(e);
    }

  

  }
}