



import 'package:test_dryve/model/carros.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


/* criar repositorio dos veiculo e seus dados
buscando estes atraves URL */
class CarrosRepository  {
List<Carros>? carros = [];

CarrosRepository();

Future<List<Carros>?> consultaCarro() async{
  
    try{
      var url = Uri.parse("https://run.mocky.io/v3/e2fe4deb-f65d-45e2-b548-39c17f08e637") ;

      //Requisição HTTP
      var resp = await http.get(url);

      if (resp.statusCode == 200){
       
      List request = json.decode(resp.body.toString());

      /* faz o tratamento dos dados extraido da URL passando estes
      para um objeto carros  */
       for (var element in request) {
        carros!.add(Carros.fromJson(element, false));        
       }      
       
      }
      return carros;
    }catch(e){
      //return -1;
      print(e);
    }

  

  }

/* Realiza uma nova consulta aplicando os filtros 
relativo ao nome, marca e cor */  
Future<List<Carros>?> consultaCarroFilter(List<String>? cor, List<String>? marca, String? nome) async{
  
    try{
      var url = Uri.parse("https://run.mocky.io/v3/e2fe4deb-f65d-45e2-b548-39c17f08e637") ;

      //Requisição HTTP
      var resp = await http.get(url);

      if (resp.statusCode == 200){

      List request = json.decode(resp.body.toString());
       for (var element in request) {
       
          if (
            nome!.toUpperCase() == element['model_name'] ||
            cor!.contains(element['color_id'].toString()) ||
         marca!.contains(element['brand_name']) ) {
           
           carros!.add(Carros.fromJson(element, false))  ;
         } 

        
        
         
       }
       
        
      }

   
      return carros;


    }catch(e){
      
      print(e);
    }

  

  }

  Future<List<Carros>?> favoritaCarro(List<String?> id) async{
  
  bool favoritar = false;
    try{
      var url = Uri.parse("https://run.mocky.io/v3/e2fe4deb-f65d-45e2-b548-39c17f08e637") ;

      //Requisição HTTP
      var resp = await http.get(url);

      if (resp.statusCode == 200){
       
      List request = json.decode(resp.body.toString());

      /* faz o tratamento dos dados extraido da URL passando estes
      para um objeto carros  */
       for (var element in request) {
         /* Acessa a lista favoriteCar e seta o atributo favoritar para true*/
         if (id.contains(element['id']) ){
           favoritar = true;
           
         }
        carros!.add(Carros.fromJson(element , favoritar));
        favoritar = false;        
       }      
       
      }
      
      return carros;
    }catch(e){
      //return -1;
      print(e);
    }

  

  }
 
}