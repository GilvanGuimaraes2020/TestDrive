import 'package:test_dryve/model/listaImagem.dart';

/* 
Gera um objeto marca contendo atribuito Id, marca e o pathimagem, utilizado como alternativa por nao encontrar referencia
 */
class ListaMarca{
  String brandid= '';
  String marca = '';
  String pathImagem = ''; //atributo definido para coletar caminho da imagem local por nao encontrar URL
  
  ListaMarca();

ListaMarca.fromJson(Map<String , dynamic> map){
  List<String> listaImgem = ListaImgem().pathImagens;
  brandid = map['brand_id'];
  marca = map['name'];
  for (var element in listaImgem) {
    if(element.contains(map['name'])){
      pathImagem = element;
    }
   }
}

}